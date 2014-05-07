#-------------------------------------------------
#
# Project created by QtCreator 2012-03-06T06:11:54
#
#-------------------------------------------------

QT       -= core

QT       -= gui

TARGET = gci.exe
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

#INCLUDEPATH += /opt/intel/composerxe/mkl/include
#LIBS += -L/opt/intel/composerxe/mkl/lib -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm

SOURCES += gci.cpp \
    gciHamiltonian.cpp \
    gciState.cpp \
    #gciNode.cpp \
    #gciExcitation.cpp \
    gciDeterminant.cpp \
    gciString.cpp \
    gciWavefunction.cpp \
    FCIdump.cpp \
    gciStringSet.cpp \
    gciExcitationSet.cpp \
    gciSymmetry.cpp \
    gciOperator.cpp \
    gciPrintable.cpp

HEADERS += gci.h \
    gciHamiltonian.h \
    gciState.h \
    #gciNode.h \
    #gciExcitation.h \
    gciDeterminant.h \
    gciString.h \
    gciWavefunction.h \
    FCIdump.h \
    gciStringSet.h \
    gciExcitationSet.h \
    gciSymmetry.h \
    gciOperator.h \
    gciPrintable.h

html.target = $$PWD/html
html.commands = (cd $$PWD ; doxygen $$PWD/Doxyfile;)
html.depends = $(OBJECTS)
dox.target = html
dox.depends = $$PWD/html
QMAKE_EXTRA_TARGETS += dox html all

all.target = all
all.depends += FCIDUMP
all.depends += html

input.target = FCIDUMP
input.commands = ln -s $$PWD/FCIDUMP FCIDUMP
input.depends =
QMAKE_EXTRA_TARGETS += input






