// Qt
#include <QDebug>

// Application
#include "keymanager.h"
#include "widgetfactory.h"
#include "parameter.h"
#include "constants.h"
#include "helper.h"
#include "keyparser.h"
#include "./editors/lineeditwidget.h"
#include "./editors/filepickerwidget.h"
#include "./editors/genericparametertable.h"
#include "./editors/exclusivechoicewidget.h"
#include "./editors/doubletripletwidget.h"
#include "./editors/filepickerwidget.h"
#include "./editors/yesnowidget.h"
#include "./editors/xyzmirrorwidget.h"
#include "./editors/intvalidator.h"
#include "./editors/doublevalidator.h"

//-------------------------------------------------------------------------------------------------

WidgetFactory::WidgetFactory(KeyManager *pParent) : QObject(pParent),
    m_pKeyManager(pParent)
{

}

//-------------------------------------------------------------------------------------------------

WidgetFactory::~WidgetFactory()
{

}

//-------------------------------------------------------------------------------------------------

bool WidgetFactory::startup(const QString &sArgs)
{
    return true;
}

//-------------------------------------------------------------------------------------------------

void WidgetFactory::shutdown()
{

}

//-------------------------------------------------------------------------------------------------

BaseWidget *WidgetFactory::buildWidget(Parameter *pParameter, QWidget *pParentWidget)
{
    if (pParameter != nullptr)
    {
        BaseWidget *pWidget = nullptr;
        QString sParameterName = pParameter->getAttributeValue(PROPERTY_NAME);
        QString sParameterType = pParameter->getAttributeValue(PROPERTY_TYPE);
        QString sParameterUI = pParameter->getAttributeValue(PROPERTY_UI);
        QString sDefaultValue = pParameter->getAttributeValue(PROPERTY_DEFAULT);
        QString sAutoScript = pParameter->getAttributeValue(PROPERTY_AUTO);
        QString sEnabledCondition = pParameter->getAttributeValue(PROPERTY_ENABLED);

        if (sParameterUI == WIDGET_GENERIC_PARAMETER_TABLE)
        {
            GenericParameterTable *pGenericParameterTable = new GenericParameterTable(m_pKeyManager, pParameter, pParentWidget);
            pWidget = pGenericParameterTable;
        }
        else
        if (sParameterUI == WIDGET_FILE_PICKER)
        {
            QString sFileExtension = pParameter->getAttributeValue(PROPERTY_FILE_EXTENSION);
            FilePickerWidget *pFilePickerWidget = new FilePickerWidget(pParameter, sFileExtension, pParentWidget);
            pWidget = pFilePickerWidget;
        }
        else
        if ((sParameterUI == WIDGET_LINE_EDIT) || (sParameterUI == WIDGET_LINE_EDIT_RETURN))
        {
            QString sMinValue = pParameter->getAttributeValue(PROPERTY_MIN_VALUE);
            QString sMaxValue = pParameter->getAttributeValue(PROPERTY_MAX_VALUE);
            LineEditWidget *pLineEdit = new LineEditWidget(pParameter, pParentWidget);
            if (sParameterType == PROPERTY_INT)
            {
                int iMin = 0;
                int iMax = 100;
                if (!sMinValue.isEmpty() && !sMaxValue.isEmpty())
                {
                    bool bOKMin = true;
                    bool bOKMax = true;
                    int iTestMin = sMinValue.toInt(&bOKMin);
                    int iTestMax = sMaxValue.toInt(&bOKMax);
                    if (bOKMin && bOKMax)
                    {
                        iMin = qMin(iTestMin, iTestMax);
                        iMax = qMax(iTestMin, iTestMax);
                    }
                }
                IntValidator *pValidator = new IntValidator(iMin, iMax, this);
                pLineEdit->setValidator(pValidator);
            }
            else
            if (sParameterType == PROPERTY_DOUBLE)
            {
                double dMin = -1000.;
                double dMax = 1000.;
                if (!sMinValue.isEmpty() && !sMaxValue.isEmpty())
                {
                    bool bOKMin = true;
                    bool bOKMax = true;
                    double dTestMin = sMinValue.toDouble(&bOKMin);
                    double dTestMax = sMaxValue.toDouble(&bOKMax);
                    if (bOKMin && bOKMax)
                    {
                        dMin = qMin(dTestMin, dTestMax);
                        dMax = qMax(dTestMin, dTestMax);
                    }
                }
                DoubleValidator *pValidator = new DoubleValidator(dMin, dMax, 3, this);
                pLineEdit->setValidator(pValidator);
            }
            pWidget = pLineEdit;
        }
        else
        if (sParameterUI == WIDGET_EXCLUSIVE_CHOICE)
        {
            QString sLabels = pParameter->getAttributeValue(PROPERTY_LABELS);
            QString sValues = pParameter->getAttributeValue(PROPERTY_VALUES);

            if (!sLabels.isEmpty() && !sValues.isEmpty())
            {
                ExclusiveChoiceWidget *pExclusiveChoiceWidet = new ExclusiveChoiceWidget(pParameter, pParentWidget);
                pWidget = pExclusiveChoiceWidet;
            }
        }
        else
        if (sParameterUI == WIDGET_DOUBLE_TRIPLET)
        {
            DoubleTripletWidget *pTriplet = new DoubleTripletWidget(pParameter, pParentWidget);
            pWidget = pTriplet;
        }
        else
        if (sParameterUI == WIDGET_YES_NO)
        {
            YesNoWidget *pYesNoWidget = new YesNoWidget(pParameter, pParentWidget);
            pWidget = pYesNoWidget;
        }
        else
        if (sParameterUI == WIDGET_XYZMIRROR)
        {
            XYZMirrorWidget *pXYZMirrorWidget = new XYZMirrorWidget(pParameter, pParentWidget);
            pWidget = pXYZMirrorWidget;
        }

        if (pWidget != nullptr)
        {
            // Update watched parameters
            QHash<QString, Parameter *> hWatchedParameters;

            // Check auto script
            if (!sAutoScript.isEmpty())
            {
                QVector<QString> vVariableNames = Helper::extractVariableNames(sAutoScript);
                foreach (QString sParameterVariable, vVariableNames)
                {
                    Parameter *pWatchedParameter = KeyParser::getParameterByVariableName(pParameter->getParentBlock()->getParentKey(), sParameterVariable);
                    if (pWatchedParameter != nullptr)
                        hWatchedParameters[sParameterVariable] = pWatchedParameter;
                }
            }

            // Check enabled condition
            if (!sEnabledCondition.isEmpty())
            {
                QVector<QString> vVariableNames = Helper::extractVariableNames(sEnabledCondition);
                foreach (QString sParameterVariable, vVariableNames)
                {
                    Parameter *pWatchedParameter = KeyParser::getParameterByVariableName(pParameter->getParentBlock()->getParentKey(), sParameterVariable);
                    if (pWatchedParameter != nullptr)
                        hWatchedParameters[sParameterVariable] = pWatchedParameter;
                }
            }

            if (!hWatchedParameters.isEmpty())
                pWidget->setWatchedParameters(hWatchedParameters);
            if (sParameterUI != WIDGET_GENERIC_PARAMETER_TABLE)
                pWidget->applyDefaultValue();
            pWidget->onEvaluateEnabledCondition();
        }

        return pWidget;
    }

    return nullptr;
}
