// Windows
#include <stdio.h>
#include <windows.h>
#include <iostream>
#include <random>
#include <cmath>

// Qt
#include <QCoreApplication>
#include <QFileInfo>
#include <QTextStream>
#include <QTime>
#include <QCryptographicHash>
#include <QStandardPaths>
#include <QSettings>
#include <QRegularExpression>
#include <QScriptEngine>
#include <QScriptValue>
#include <QDebug>

// Application
#include "helper.h"
#include "constants.h"
#include "block.h"
#include "parameter.h"
#include "keyparser.h"
//#define DEBUG_INFO 1
//#define DEBUG_WARNING 1
#define DEBUG_ERROR 1

//-------------------------------------------------------------------------------------------------

bool Helper::fileExists(const QString &sFilePath)
{
    QFileInfo fi(sFilePath);
    return fi.exists();
}

//-------------------------------------------------------------------------------------------------

bool Helper::loadFile(const QString &sInputFile, QString &sFileContents)
{
    sFileContents.clear();
    QFileInfo fi(sInputFile);
    if (fi.exists())
    {
        QFile file(sInputFile);
        if (file.open(QFile::ReadOnly | QFile::Text))
        {
            QTextStream stream(&file);
            sFileContents = stream.readAll();
            file.close();
            return !sFileContents.isEmpty();
        }
    }
    return false;
}

//-------------------------------------------------------------------------------------------------

QString Helper::getDiskSerial()
{
    DWORD dwVolSerial;
    BOOL bIsRetrieved = GetVolumeInformation(L"C:\\", NULL, NULL, &dwVolSerial, NULL, NULL, NULL, NULL);
    if (bIsRetrieved)
        return QString::number(dwVolSerial, 16);
    return QString("");
}

//-------------------------------------------------------------------------------------------------

QString Helper::getDiskSerialHash()
{
    return QCryptographicHash::hash(Helper::getDiskSerial().toLatin1(), QCryptographicHash::Sha256).toHex().toUpper();
}

//-------------------------------------------------------------------------------------------------

bool Helper::saveFile(const QString &sFileContents, const QString &sOutputFile)
{
    QFile outputFile(sOutputFile);
    if (outputFile.open(QIODevice::WriteOnly))
    {
        QTextStream outStream(&outputFile);
        outStream << sFileContents;
        outputFile.close();
        return true;
    }
    return false;
}

//-------------------------------------------------------------------------------------------------

QDir Helper::appDir()
{
    return QCoreApplication::applicationDirPath();
}

//-------------------------------------------------------------------------------------------------

QDir Helper::outputDir()
{
    QDir tmpLocation = QStandardPaths::writableLocation(QStandardPaths::TempLocation);
    tmpLocation.cdUp();
    tmpLocation.mkdir(OUTPUT_DIR);
    tmpLocation.cd(OUTPUT_DIR);
    qDebug() << tmpLocation;
    return tmpLocation;
}

//-------------------------------------------------------------------------------------------------

QDir Helper::dataDir()
{
    QDir dDataDir = appDir();
    dDataDir.cdUp();
    dDataDir.cd(KEYBUILDER_DIR);
    dDataDir.cd(DATA_DIR);
    return dDataDir;
}

//-------------------------------------------------------------------------------------------------

QDir Helper::templatesDirectory()
{
    QDir dataDir = appDir();
    dataDir.cd(TEMPLATES_DIR);
    return dataDir;
}

//-------------------------------------------------------------------------------------------------

QString Helper::openSCADPath()
{
    QDir openSCADDir = appDir();
    openSCADDir.cd(OPENSCAD_DIR);
    QString sOpenSCADPath = openSCADDir.absoluteFilePath(OPENSCAD_EXE);
    QFileInfo fi(sOpenSCADPath);
    if (!fi.exists())
        return QString("");
    return sOpenSCADPath;
}

//-------------------------------------------------------------------------------------------------

void Helper::replaceInFile(const QString &sInputFile, const QString &sInputString, const QString &sOutputString, Qt::CaseSensitivity iSensitivity)
{
    QFileInfo fi(sInputFile);
    if (fi.exists())
    {
        QString sFileContents("");
        if (Helper::loadFile(sInputFile, sFileContents))
        {
            while (sFileContents.contains(sInputString, iSensitivity))
                sFileContents.replace(sInputString, sOutputString);
            saveFile(sFileContents, sInputFile);
        }
    }
}

//-------------------------------------------------------------------------------------------------

QString Helper::randHex(int iLength)
{
    qsrand(QTime::currentTime().msec());
    const QString sPossibleCharacters("0123456789ABCDEF");
    QString sRandomString;
    for(int i=0; i<iLength; ++i)
    {
        int index = qrand() % sPossibleCharacters.length();
        QChar nextChar = sPossibleCharacters.at(index);
        sRandomString.append(nextChar);
    }
    return sRandomString.toUpper();
}

//-------------------------------------------------------------------------------------------------

QString Helper::simpleEncode(const QString &sInput, const QVector<int> &vOrder)
{
    QString sOutput("");
    for (int i=0; i<vOrder.size(); i++)
    {
        if ((vOrder[i] >= 0) && (vOrder[i] < sInput.length()))
            sOutput += sInput.at(vOrder[i]);
    }
    if (sOutput.length() != sInput.length())
    {
        qDebug() << "FAILED TO REORDER INPUT STRING";
        return sInput;
    }
    return sOutput;
}

//-------------------------------------------------------------------------------------------------

QString Helper::simpleDecode(const QString &sInput, const QVector<int> &vOrder)
{
    QString sOutput("");
    for (int i=0; i<vOrder.size(); i++)
    {
        int iIndex = vOrder.indexOf(i);

        if ((iIndex >= 0) && (iIndex < sInput.length()))
            sOutput += sInput.at(iIndex);
    }
    if (sOutput.length() != sInput.length())
    {
        qDebug() << "FAILED TO REORDER INPUT STRING";
        return sInput;
    }
    return sOutput;
}

//-------------------------------------------------------------------------------------------------

QVector<int> Helper::buildOrder(int nItems)
{
    qsrand(QTime::currentTime().msec());
    QVector<int> vOrigOrder;
    for (int i=0; i<nItems; i++)
        vOrigOrder << i;
    QVector<int> vOut;
    while (!vOrigOrder.isEmpty())
    {
        int iBottom = 0;
        int iTop = vOrigOrder.size()-1;
        int iRand = qrand()%((iTop + 1)-iBottom)+iBottom;
        vOut << vOrigOrder[iRand];
        vOrigOrder.takeAt(iRand);
    }
    return vOut;
}

//-------------------------------------------------------------------------------------------------

int Helper::randInt(int iMin, int iMax)
{
    qsrand(QTime::currentTime().msec());
    return ((qrand() % ((iMax + 1) - iMin)) + iMin);
}

//-------------------------------------------------------------------------------------------------

void Helper::updateSettings(const QString &sFileName)
{
    QSettings settings(OUTPUT_STRING, OUTPUT_STRING);
    QFileInfo fi(sFileName);
    if (fi.exists())
        settings.setValue(LAST_VISITED_DIR, fi.absoluteDir().absolutePath());
}

//-------------------------------------------------------------------------------------------------

QString Helper::settingsValue(const QString &sName)
{
    QSettings settings(OUTPUT_STRING, OUTPUT_STRING);
    return settings.value(sName).toString();
}

//-------------------------------------------------------------------------------------------------

QVector<QString> Helper::extractVariableNames(const QString &sInputString)
{
    QVector<QString> vVariableNames;
    QRegularExpression regExp("qt_(.*?)_qt");
    QRegularExpressionMatchIterator i = regExp.globalMatch(sInputString);
    while (i.hasNext())
    {
        QRegularExpressionMatch match = i.next();
        QString sCaptured = match.captured(0);
        if (match.hasMatch() && !vVariableNames.contains(sCaptured))
            vVariableNames << sCaptured;
    }
    return vVariableNames;
}

//-------------------------------------------------------------------------------------------------

bool Helper::evaluateEnabledCondition(Block *pParentBlock, const QString &sEnabledCondition, bool &bSuccess)
{
    if (pParentBlock != nullptr && !sEnabledCondition.isEmpty())
    {
        QVector<QString> vVariableNames = extractVariableNames(sEnabledCondition);
        QString sMatchedScript = sEnabledCondition;
        bSuccess = true;
        foreach (QString sParameterVariable, vVariableNames)
        {
            Parameter *pParameter = KeyParser::getParameterByVariableName(pParentBlock->getParentKey(), sParameterVariable);
            if (pParameter == nullptr)
            {
                QString sMsg = QString("CAN'T EVALUATE: %1 SINCE PARAMETER VARIABLE: %2 DOES NOT EXIST").arg(sEnabledCondition).arg(sParameterVariable);
                Helper::error(sMsg);
                bSuccess = false;
                break;
            }
            if (pParameter->getAttributeValue(PROPERTY_TYPE) == PROPERTY_STRING)
            {
                sMatchedScript.replace("&quot;", "\"");
                QString sQuotedString = QString("\"%1\"").arg(pParameter->getValue());
                sMatchedScript.replace(sParameterVariable, sQuotedString);
            }
            else
                sMatchedScript.replace(sParameterVariable, pParameter->getValue());
        }
        if (bSuccess)
        {
            /*
            bSuccess = false;
            QScriptEngine expression;
            QScriptValue xResult = expression.evaluate(sMatchedScript);
            if (xResult.isBoolean())
            {
                bSuccess = true;
                return xResult.toBool();
            }
            */
        }
    }
    return true;
}

//-------------------------------------------------------------------------------------------------

QString Helper::identifyTargetVariable_method1(const QString &sTargetVariable, const QStringList &lColumnVariables, const QString &sTargetRow, int iColumn, int iRow)
{
    QString sRowNumber = QString::number(iRow+1);
    if (sRowNumber.length() < 2)
        sRowNumber = "0"+sRowNumber;
    QString sFormattedVariable = QString(sTargetVariable).arg(sTargetRow).arg(sRowNumber).arg(lColumnVariables[iColumn]);
    return sFormattedVariable;
}

//-------------------------------------------------------------------------------------------------

QString Helper::identifyTargetVariable_method2(const QString &sTargetVariable, int iRow)
{
    QString sRowNumber = QString::number(iRow+1);
    if (sRowNumber.length() < 2)
        sRowNumber = "0"+sRowNumber;
    QString sFormattedVariable = QString(sTargetVariable).arg(sRowNumber);
    return sFormattedVariable;
}

//-------------------------------------------------------------------------------------------------

QString Helper::evaluateAutoScript(Block *pParentBlock, const QString &sAutoScript, bool &bSuccess)
{
    if (pParentBlock != nullptr)
    {
        QVector<QString> vVariableNames = extractVariableNames(sAutoScript);
        QString sMatchedScript = sAutoScript;
        bSuccess = true;
        foreach (QString sParameterVariable, vVariableNames)
        {
            Parameter *pParameter = KeyParser::getParameterByVariableName(pParentBlock->getParentKey(), sParameterVariable);
            if (pParameter == nullptr)
            {
                QString sMsg = QString("CAN'T EVALUATE: %1 SINCE PARAMETER VARIABLE: %2 DOES NOT EXIST").arg(sAutoScript).arg(sParameterVariable);
                Helper::error(sMsg);
                bSuccess = false;
                break;
            }
            sMatchedScript.replace(sParameterVariable, pParameter->getValue());
        }
        if (bSuccess)
        {
            bSuccess = false;
            QScriptEngine expression;
            QScriptValue xResult = expression.evaluate(sMatchedScript);
            if (xResult.isNumber())
            {
                bSuccess = true;
                return xResult.toString();
            }
        }
    }
    return QString("");
}

//-------------------------------------------------------------------------------------------------

bool Helper::allVariablesReplaced(const QString &sFileName, QVector<QString> &vUnReplacedVariables)
{
    vUnReplacedVariables.clear();
    QString sFileContents("");
    if (loadFile(sFileName, sFileContents))
    {
        vUnReplacedVariables = extractVariableNames(sFileContents);
        return vUnReplacedVariables.isEmpty();
    }
    return true;
}

//-------------------------------------------------------------------------------------------------

QString Helper::getFormattedVariableName(const QString &sVariableMethod, const QString &sTargetVariable, const QStringList &lColumnVariables, const QString &sTargetRow, int iColumn, int iRow)
{
    QString sFormattedVariable("");
    if (sVariableMethod == PROPERTY_VARIABLE_METHOD1)
    {
        sFormattedVariable = Helper::identifyTargetVariable_method1(sTargetVariable, lColumnVariables, sTargetRow, iColumn, iRow);
    }
    else
    if (sVariableMethod == PROPERTY_VARIABLE_METHOD2)
    {
        sFormattedVariable = Helper::identifyTargetVariable_method2(sTargetVariable, iRow);
    }
    return sFormattedVariable;
}

//-------------------------------------------------------------------------------------------------

void Helper::info(const QString &sInfo)
{
#ifdef DEBUG_INFO
    qDebug() << sInfo;
#endif
}

//-------------------------------------------------------------------------------------------------

void Helper::warning(const QString &sWarning)
{
#ifdef DEBUG_WARNING
    qDebug() << sWarning;
#endif
}

//-------------------------------------------------------------------------------------------------

void Helper::error(const QString &sError)
{
#ifdef DEBUG_ERROR
    qDebug() << sError;
#endif
}
