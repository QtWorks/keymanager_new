#-------------------------------------------------
#
# Project created by QtCreator 2017-07-25T14:07:16
#
#-------------------------------------------------

#QT       += core gui xml script svg

QT       += core gui xml svg script
CONFIG += static
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
INCLUDEPATH += $$PWD/../stllibrary

TARGET = keybuilder
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG(debug, debug|release) {
    LIBS += -L$$PWD/../bin -lfstld
    TARGET = keybuilderd
} else {
    LIBS += -L$$PWD/../bin -lfstl
    TARGET = keybuilder
}

unix {
    DESTDIR = ../bin
    MOC_DIR = ../moc
    OBJECTS_DIR = ../obj
}

win32 {
    DESTDIR = ..\\bin
    MOC_DIR = ..\\moc
    OBJECTS_DIR = ..\\obj
}

unix {
    QMAKE_CLEAN *= $$DESTDIR/*$$TARGET*
    QMAKE_CLEAN *= $$MOC_DIR/*moc_*
    QMAKE_CLEAN *= $$OBJECTS_DIR/*.o*
}

win32 {
    QMAKE_CLEAN *= $$DESTDIR\\*$$TARGET*
    QMAKE_CLEAN *= $$MOC_DIR\\*moc_*
    QMAKE_CLEAN *= $$OBJECTS_DIR\\*.o*
}


SOURCES += main.cpp \
    mainwindow.cpp \
    keymanager.cpp \
    keyparser.cpp \
    cxmlnode.cpp \
    encoder.cpp \
    helper.cpp \
    parameter.cpp \
    key.cpp \
    keywidget.cpp \
    codeeditor.cpp \
    hometab.cpp \
    descriptiontaggedwidget.cpp \
    licensewidget.cpp \
    texteditor.cpp \
    editors/basewidget.cpp \
    editors/doubletripletwidget.cpp \
    editors/doublevalidator.cpp \
    editors/filepickerwidget.cpp \
    editors/exclusivechoicewidget.cpp \
    editors/lineeditwidget.cpp \
    editors/xyzmirrorwidget.cpp \
    editors/yesnowidget.cpp \
    block.cpp \
    editors/intvalidator.cpp \
    widgetfactory.cpp \
    parameterblock.cpp \
    collapsiblestack.cpp \
    collpasibleblock.cpp \
    captionlabel.cpp \
    editors/genericparametertable.cpp \
    editors/customheaderview.cpp \
    editors/customtableview.cpp \
    editors/headerobject.cpp \
    layoutmgr.cpp \
    customtreeview.cpp \
    keypreviewwidget.cpp \
    selectionmgr.cpp \
    blockmodel.cpp \
    scriptmanager.cpp
		
HEADERS  += \
    mainwindow.h \
    keymanager.h \
    iservice.h \
    keyparser.h \
    cxmlnode.h \
    encoder.h \
    constants.h \
    helper.h \
    parameter.h \
    key.h \
    keywidget.h \
    codeeditor.h \
    hometab.h \
    descriptiontaggedwidget.h \
    licensewidget.h \
    texteditor.h \
    block.h \
    editors/basewidget.h \
    editors/doubletripletwidget.h \
    editors/filepickerwidget.h \
    editors/exclusivechoicewidget.h \
    editors/lineeditwidget.h \
    editors/xyzmirrorwidget.h \
    editors/yesnowidget.h \
    editors/doublevalidator.h \
    editors/intvalidator.h \
    widgetfactory.h \
    parameterblock.h \
    collapsibleblock.h \
    collapsiblestack.h \
    captionlabel.h \
    editors/genericparametertable.h \
    editors/customheaderview.h \
    editors/customtableview.h \
    editors/headerobject.h \
    layoutmgr.h \
    customtreeview.h \
    keypreviewwidget.h \
    selectionmgr.h \
    blockmodel.h \
    scriptmanager.h

FORMS    += mainwindow.ui \
    keywidget.ui \
    codeeditor.ui \
    hometab.ui \
    licensewidget.ui \
    editors/doubletripletwidget.ui \
    editors/exclusivechoicewidget.ui \
    editors/filepickerwidget.ui \
    editors/genericparametertable.ui \
    editors/lineeditwidget.ui \
    editors/xyzmirrorwidget.ui \
    editors/yesnowidget.ui \
    parameterblock.ui \
    captionlabel.ui \
    editors/headerobject.ui \
    layoutmgr.ui

DISTFILES +=

RESOURCES += \
    resources.qrc
