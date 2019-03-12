#ifndef HELPER_H
#define HELPER_H

// Qt
#include <QString>
#include <QDir>

// Application
class Block;

class Helper
{
public:
    //! Return true if file exists
    static bool fileExists(const QString &sFilePath);

    //! Return disk serial number
    static QString getDiskSerial();

    //! Return disk hash
    static QString getDiskSerialHash();

    //! Load file
    static bool loadFile(const QString &sInputFile, QString &sFileContents);

    //! Save file
    static bool saveFile(const QString &sFileContents, const QString &sOutputFile);

    //! Return application directory
    static QDir appDir();

    //! Return output directory
    static QDir outputDir();

    //! Return data dir
    static QDir dataDir();

    //! Return data directory
    static QDir templatesDirectory();

    //! Return OpenSCAD path
    static QString openSCADPath();

    //! Replace inputString by output string in given file
    static void replaceInFile(const QString &sInputFile, const QString &sInputString, const QString &sOutputString, Qt::CaseSensitivity iSensitivity=Qt::CaseInsensitive);

    //! Generate random hex
    static QString randHex(int iLength=16);

    //! Simple encode
    static QString simpleEncode(const QString &sInput, const QVector<int> &vOrder);

    //! Simple decode
    static QString simpleDecode(const QString &sInput, const QVector<int> &vOrder);

    //! Reorder input array randomly
    static QVector<int> buildOrder(int nItems);

    //! Generate rand int
    static int randInt(int iMin=0, int iMax=256);

    //! Update settings
    static void updateSettings(const QString &sFileName);

    //! Return settings value
    static QString settingsValue(const QString &sName);

    //! Extract variable names
    static QVector<QString> extractVariableNames(const QString &sInputString);

    //! Evaluate enabled condition
    static bool evaluateEnabledCondition(Block *pParentBlock, const QString &sEnabledCondition, bool &bSuccess);

    //! Identify variable meth1
    static QString identifyTargetVariable_method1(const QString &sTargetVariable, const QStringList &lColumnVariables, const QString &sTargetRow, int iColumn, int iRow);

    //! Identify variable meth2
    static QString identifyTargetVariable_method2(const QString &sTargetVariable, int iRow);

    //! Evaluate auto script
    static QString evaluateAutoScript(Block *pParentBlock, const QString &sAutoScript, bool &bSuccess);

    //! Check if all variables replaced
    static bool allVariablesReplaced(const QString &sFileName, QVector<QString> &vUnReplacedVariables);

    //! Return a formatted variable name
    static QString getFormattedVariableName(const QString &sVariableMethod, const QString &sTargetVariable, const QStringList &lColumnVariables, const QString &sTargetRow, int iColumn, int iRow);

    //! Return a unique filename based on data
    static QString getUniqueFileName(const QString &sBaseName, const QString &sExtension);

    //! Display info
    static void info(const QString &sInfo);

    //! Display warning
    static void warning(const QString &sWarning);

    //! Display error
    static void error(const QString &sError);
};

#endif // HELPER_H

