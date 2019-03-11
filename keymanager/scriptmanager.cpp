// Qt
#include <QDebug>

// Application
#include "keymanager.h"
#include "scriptmanager.h"
#include "helper.h"
#include "block.h"
#include "parameter.h"
#include "constants.h"
#include "keyparser.h"
#include "key.h"

//-------------------------------------------------------------------------------------------------

ScriptManager::ScriptManager(KeyManager *pKeyManager) : QObject(pKeyManager),
    m_pKeyManager(pKeyManager)
{

}

//-------------------------------------------------------------------------------------------------

ScriptManager::~ScriptManager()
{

}

//-------------------------------------------------------------------------------------------------

bool ScriptManager::startup(const QString &sArgs)
{
    return true;
}

//-------------------------------------------------------------------------------------------------

void ScriptManager::shutdown()
{

}

//-------------------------------------------------------------------------------------------------

bool ScriptManager::generateOutputSCADForKey(Key *pTargetKey)
{
    if (pTargetKey != nullptr)
    {
        // Check input script file exists
        QString sInputScriptFile = ":/data/SCAD_SCRIPT/newscript.scad";

        // Check input script file exists
        if (!Helper::fileExists(sInputScriptFile))
        {
            QString sMsg = QString("ScriptManager::generateScriptForKey FILE %1 DOES NOT EXIST").arg(sInputScriptFile);
            Helper::error(sMsg);
            return false;
        }

        QString sScriptText("");
        if (Helper::loadFile(sInputScriptFile, sScriptText))
        {
            // Get settings key
            Key *pSettingsKey = m_pKeyManager->keyParser().getKey(SETTINGS_KEY);
            if (pSettingsKey != nullptr)
                replaceVariablesInScriptForKey(pSettingsKey, sScriptText);

            // Right target key
            replaceVariablesInScriptForKey(pTargetKey, sScriptText);

            // Process other keys
            QVector<Key *> vKeys = m_pKeyManager->keyParser().getKeys();
            vKeys.removeAll(pSettingsKey);
            vKeys.removeAll(pTargetKey);

            foreach (Key *pCurrentKey, vKeys)
            {
                // Check key
                if (pCurrentKey == nullptr || pCurrentKey == pTargetKey || pCurrentKey == pSettingsKey)
                    continue;

                // Replace variables in script for key
                replaceVariablesInScriptForKey(pCurrentKey, sScriptText, true);
            }

            // Save file
            QString sOutputSCADFilePath = pTargetKey->getOutputSCADFileName();
            if (Helper::saveFile(sScriptText, sOutputSCADFilePath))
            {
                QVector<QString> vUnreplacedVariables;
                if (!Helper::allVariablesReplaced(sOutputSCADFilePath, vUnreplacedVariables))
                {
                    QString sMsg = QString("ScriptManager::generateScriptForKey ALL VARIABLES COULD NOT BE REPLACED IN: %1").arg(sOutputSCADFilePath);
                    Helper::info(sMsg);
                    int count = 0;
                    foreach (QString sUnreplacedVariable, vUnreplacedVariables)
                        qDebug() << ++count << "UNREPLACED VARIABLE : " << sUnreplacedVariable;
                }
                QString sMsg = QString("ScriptManager::generateScriptForKey SCAD SCRIPT SUCCESSFULLY EXPORTED IN: %1").arg(sOutputSCADFilePath);
                Helper::info(sMsg);
                return true;
            }
            else
            {
                QString sMsg = QString("ScriptManager::generateScriptForKey COULD NOT EXPORT SCAD SCRIPT TO: %1").arg(sOutputSCADFilePath);
                Helper::error(sMsg);
                return false;
            }
        }
    }

    return true;
}

//-------------------------------------------------------------------------------------------------

void ScriptManager::replaceVariablesInScriptForKey(Key *pTargetKey, QString &sScriptText, bool bErase)
{
    if (pTargetKey != nullptr)
    {
        // Retrieve parameter for key
        QHash<QString, Parameter *> hParameters = KeyParser::getParametersForKey(pTargetKey);

        // Iterate parameters
        for (QHash<QString, Parameter *>::iterator it=hParameters.begin(); it!=hParameters.end(); ++it)
        {
            Parameter *pParameter = it.value();
            if (pParameter != nullptr)
            {
                // Retrieve parameter name
                QString sParameterName = pParameter->getAttributeValue(PROPERTY_NAME);
                bool bIsKeyLabel = sParameterName.contains(TEXT_LINE);

                // Retrieve parameter variable
                QString sParameterVariable = it.key();

                // Retrieve parameter value
                QString sParameterValue = pParameter->getValue();

                // Retrieve parameter type
                QString sParameterType = pParameter->getAttributeValue(PROPERTY_TYPE);

                // Check parameter value
                if (sParameterValue.isEmpty())
                {
                    QString sUnsetValue = pParameter->getUnsetValue();
                    sParameterValue = !sUnsetValue.isEmpty() ? sUnsetValue : pParameter->getAttributeValue(PROPERTY_DEFAULT);
                }

                if (bErase)
                {
                    sScriptText.replace(sParameterVariable, bIsKeyLabel ? QString("") : ERASE_VALUE);
                    if (sScriptText.indexOf(sParameterVariable) != -1)
                    {
                        QString sError = QString("ScriptManager::replaceVariablesInScriptForKey COULD NOT REPLACE VARIABLE %1 WITH ERASE VALUE 0 FOR KEY %2").arg(sParameterVariable).arg(pTargetKey->getAttributeValue(PROPERTY_NAME));
                        Helper::error(sError);
                    }
                }
                else
                {
                    if ((sParameterType != PROPERTY_STRING) && (sParameterType != PROPERTY_BOOLEAN))
                    {
                        sScriptText.replace(sParameterVariable, sParameterValue);
                        if (sScriptText.indexOf(sParameterVariable) != -1)
                        {
                            QString sError = QString("ScriptManager::replaceVariablesInScriptForKey COULD NOT REPLACE VARIABLE %1 WITH VALUE %2 FOR KEY %3").arg(sParameterVariable).arg(sParameterValue).arg(pTargetKey->getAttributeValue(PROPERTY_NAME));
                            Helper::error(sError);
                        }
                    }
                    else
                    {
                        QString sQuotedValue = QString("\"%1\"").arg(sParameterValue);
                        sScriptText.replace(sParameterVariable, sQuotedValue);
                        if (sScriptText.indexOf(sParameterVariable) != -1)
                        {
                            QString sError = QString("ScriptManager::replaceVariablesInScriptForKey COULD NOT REPLACE VARIABLE %1 WITH VALUE %2 FOR KEY %2").arg(sParameterVariable).arg(sQuotedValue).arg(pTargetKey->getAttributeValue(PROPERTY_NAME));
                            Helper::error(sError);
                        }
                    }
                }
            }
        }

        // Recurse
        foreach (Key *pChildKey, pTargetKey->getChildKeys())
            if (pChildKey != nullptr)
                replaceVariablesInScriptForKey(pChildKey, sScriptText, bErase);
    }
}
