# Add more folders to ship with the application, here
folder_01.source = qml
folder_01.target =
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

CONFIG += c++11

QT += network webkitwidgets xml sql
QT -= gui

ICON = ing.icns

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += \
    main.cpp \
    Account.cpp \
    AccountInfoProvider.cpp \
    Settings.cpp \
    AccountModel.cpp \
    HistoryModel.cpp \
    HistoryEntry.cpp


HEADERS += \
    Account.hpp \
    AccountInfoProvider.hpp \
    Settings.hpp \
    AccountModel.hpp \
    HistoryModel.hpp \
    HistoryEntry.hpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/DropShadowText.qml \
    qml/AccountEntry.qml

RESOURCES += \
    assets.qrc

