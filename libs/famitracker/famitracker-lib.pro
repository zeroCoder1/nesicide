#-------------------------------------------------
#
# Project created by QtCreator 2013-02-05T19:20:22
#
#-------------------------------------------------

TARGET = famitracker
TEMPLATE = lib

QT += widgets

TOP = ../..

DEFINES += FAMITRACKER_LIBRARY

DEFINES -= UNICODE

QMAKE_CXXFLAGS_WARN_ON += -Wno-reorder -Wno-unused

INCLUDEPATH += \
   . \
   Source \
   $$TOP/common

win32 {
	DEPENDENCYPATH = $$TOP/deps/Windows
}
mac {
	DEPENDENCYPATH = $$TOP/deps/osx
}
#unix:mac {
#	DEPENDENCYPATH = $$TOP/deps/linux
#}

win32 {

   SDL_CXXFLAGS = -I$$DEPENDENCYPATH/SDL
   SDL_LIBS =  -L$$DEPENDENCYPATH/SDL/ -lsdl
}

mac {
   SDL_CXXFLAGS = -I$$DEPENDENCYPATH/SDL.framework/Headers
   SDL_LIBS = -F$$DEPENDENCYPATH -framework SDL
}

unix:!mac {
    isEmpty (SDL_CXXFLAGS) {
       SDL_CXXFLAGS = $$system(sdl-config --cflags)
    }

    SDL_CXXFLAGS += -I/usr/include/wine/windows/ -DUSE_WS_PREFIX -DWINE_UNICODE_NATIVE
    SDL_CFLAGS += -I/usr/include/wine/windows/

    isEmpty (SDL_LIBS) {
            SDL_LIBS = $$system(sdl-config --libs)
    }

   PREFIX = $$(PREFIX)
   isEmpty (PREFIX) {
      PREFIX = /usr/local
   }

   isEmpty (BINDIR) {
                BINDIR=$$PREFIX/bin
   }

   target.path = $$BINDIR
   INSTALLS += target
}

QMAKE_CXXFLAGS += $$SDL_CXXFLAGS
QMAKE_CFLAGS += $$SDL_CFLAGS
LIBS += $$SDL_LIBS

SOURCES += \
    Source/TrackerChannel.cpp \
    Source/SoundGen.cpp \
    Source/Settings.cpp \
    Source/Sequence.cpp \
    Source/PatternEditor.cpp \
    Source/PatternData.cpp \
    Source/PatternCompiler.cpp \
    Source/PatternAction.cpp \
    Source/MainFrm.cpp \
    Source/InstrumentVRC7.cpp \
    Source/InstrumentVRC6.cpp \
    Source/InstrumentS5B.cpp \
    Source/InstrumentFDS.cpp \
    Source/Instrument2A03.cpp \
    Source/Instrument.cpp \
    Source/Graphics.cpp \
    Source/FrameEditor.cpp \
    Source/FrameAction.cpp \
    Source/FamiTrackerDoc.cpp \
    Source/DocumentFile.cpp \
    Source/ChannelsVRC7.cpp \
    Source/ChannelsVRC6.cpp \
    Source/ChannelsS5B.cpp \
    Source/ChannelsN163.cpp \
    Source/ChannelsMMC5.cpp \
    Source/ChannelsFDS.cpp \
    Source/Channels2A03.cpp \
    Source/ChannelMap.cpp \
    Source/ChannelHandler.cpp \
    Source/Action.cpp \
    Source/APU/VRC6.CPP \
    Source/APU/N163.CPP \
    Source/APU/MMC5.CPP \
    Source/APU/FDS.CPP \
    Source/APU/DPCM.CPP \
    Source/APU/APU.CPP \
    Source/APU/VRC7.cpp \
    Source/APU/Triangle.cpp \
    Source/APU/Square.cpp \
    Source/APU/S5B.cpp \
    Source/APU/Noise.cpp \
    Source/APU/Mixer.cpp \
    Source/APU/FDSSound.cpp \
    Source/APU/emu2413.c \
    Source/APU/emu2149.c \
    Source/Blip_Buffer/Blip_Buffer.cpp \
    Source/FFT/Fft.cpp \
    $$TOP/common/cqtmfc.cpp \
    Source/FamiTrackerView.cpp \
    Source/FamiTracker.cpp \
    Source/DirectSound.cpp \
    Source/SWSpectrum.cpp \
    Source/SWSampleScope.cpp \
    Source/SampleWindow.cpp \
    Source/GraphEditor.cpp \
    Source/SequenceEditor.cpp \
    Source/SizeEditor.cpp \
    Source/SequenceSetting.cpp \
    Source/InstrumentEditor2A03.cpp \
    Source/InstrumentEditPanel.cpp \
    Source/InstrumentEditDlg.cpp \
    Source/InstrumentEditorDPCM.cpp \
    Source/SampleEditorDlg.cpp \
    Source/PCMImport.cpp \
    Source/resampler/sinc.cpp \
    Source/resampler/resample.inl \
    Source/resampler/resample.cpp \
    Source/cqtmfc_famitracker.cpp \
    Source/InstrumentEditorVRC7.cpp \
    Source/InstrumentEditorVRC6.cpp \
    Source/InstrumentEditorFDS.cpp \
    Source/InstrumentN163.cpp \
    Source/WaveEditor.cpp \
    Source/ModSequenceEditor.cpp \
    Source/InstrumentEditorFDSEnvelope.cpp \
    Source/InstrumentEditorN163Wave.cpp \
    Source/InstrumentEditorN163.cpp \
    Source/InstrumentEditorS5B.cpp \
    Source/ChannelsDlg.cpp \
    Source/ModulePropertiesDlg.cpp \
    Source/ModuleImportDlg.cpp \
    Source/SpeedDlg.cpp \
    Source/SWLogo.cpp \
    Source/WavProgressDlg.cpp \
    Source/WaveFile.cpp \
    Source/ControlPanelDlg.cpp \
    Source/CustomControls.cpp \
    Source/ExportDialog.cpp \
    Source/CustomExporters.cpp \
    Source/CustomExporter.cpp \
    Source/CustomExporter_C_Interface.cpp \
    Source/Compiler.cpp \
    Source/Chunk.cpp \
    Source/ChunkRender.cpp \
    Source/CommentsDlg.cpp \
    Source/InstrumentFileTree.cpp \
    Source/Accelerator.cpp \
    Source/ConfigWindow.cpp \
    Source/ConfigSound.cpp \
    Source/ConfigShortcuts.cpp \
    Source/ConfigMIDI.cpp \
    Source/DialogReBar.cpp \
    Source/ConfigGeneral.cpp \
    Source/ConfigAppearance.cpp

HEADERS += \
    Source/TrackerChannel.h \
    Source/SoundGen.h \
    Source/Settings.h \
    Source/Sequence.h \
    Source/PatternEditor.h \
    Source/PatternData.h \
    Source/PatternCompiler.h \
    Source/MainFrm.h \
    Source/Instrument.h \
    Source/Graphics.h \
    Source/FrameEditor.h \
    Source/FamiTrackerTypes.h \
    Source/FamiTrackerDoc.h \
    Source/Driver.h \
    Source/DocumentFile.h \
    Source/CustomExporterInterfaces.h \
    Source/Compiler.h \
    Source/Common.h \
    Source/ColorScheme.h \
    Source/Chunk.h \
    Source/ChannelsVRC7.h \
    Source/ChannelsVRC6.h \
    Source/ChannelsS5B.h \
    Source/ChannelsN163.h \
    Source/ChannelsMMC5.h \
    Source/ChannelsFDS.h \
    Source/Channels2A03.h \
    Source/ChannelMap.h \
    Source/ChannelHandler.h \
    Source/Action.h \
    Source/APU/vrc7tone.h \
    Source/APU/VRC7.h \
    Source/APU/VRC6.H \
    Source/APU/Triangle.h \
    Source/APU/Square.h \
    Source/APU/S5B.h \
    Source/APU/Noise.h \
    Source/APU/N163.H \
    Source/APU/MMC5.H \
    Source/APU/Mixer.h \
    Source/APU/FDSSound.h \
    Source/APU/FDS.H \
    Source/APU/External.h \
    Source/APU/emu2413.h \
    Source/APU/emu2149.h \
    Source/APU/DPCM.h \
    Source/APU/Channel.h \
    Source/APU/APU.h \
    Source/APU/2413tone.h \
    Source/Blip_Buffer/Blip_Buffer.h \
    Source/drivers/drv_vrc7.h \
    Source/drivers/drv_vrc6.h \
    Source/drivers/drv_n163.h \
    Source/drivers/drv_mmc5.h \
    Source/drivers/drv_fds.h \
    Source/drivers/drv_2a03.h \
    Source/drivers/config.h \
    Source/FFT/Fft.h \
    Source/FFT/Complex.h \
    $$TOP/common/cqtmfc.h \
    Source/FamiTrackerView.h \
    Source/FamiTracker.h \
    Source/stdafx.h \
    Source/DirectSound.h \
    Source/resource.h \
    Source/SWSpectrum.h \
    Source/SWSampleScope.h \
    Source/SampleWindow.h \
    Source/GraphEditor.h \
    Source/SequenceEditor.h \
    Source/SizeEditor.h \
    Source/SequenceSetting.h \
    Source/InstrumentEditor2A03.h \
    Source/InstrumentEditPanel.h \
    Source/InstrumentEditDlg.h \
    Source/InstrumentEditorDPCM.h \
    Source/SampleEditorDlg.h \
    Source/PCMImport.h \
    Source/resampler/sinc.hpp \
    Source/resampler/resample.hpp \
    Source/cqtmfc_famitracker.h \
    Source/InstrumentEditorVRC7.h \
    Source/InstrumentEditorVRC6.h \
    Source/InstrumentEditorFDS.h \
    Source/WaveEditor.h \
    Source/ModSequenceEditor.h \
    Source/InstrumentEditorFDSEnvelope.h \
    Source/InstrumentEditorN163Wave.h \
    Source/InstrumentEditorN163.h \
    Source/InstrumentEditorS5B.h \
    Source/ChannelsDlg.h \
    Source/ModulePropertiesDlg.h \
    Source/ModuleImportDlg.h \
    Source/SpeedDlg.h \
    Source/SWLogo.h \
    Source/WavProgressDlg.h \
    Source/WaveFile.h \
    Source/ControlPanelDlg.h \
    Source/CustomControls.h \
    Source/ExportDialog.h \
    Source/CustomExporters.h \
    Source/CustomExporter.h \
    Source/CustomExporter_C_Interface.h \
    Source/ChunkRender.h \
    Source/CommentsDlg.h \
    Source/InstrumentFileTree.h \
    Source/Accelerator.h \
    Source/ConfigWindow.h \
    Source/ConfigSound.h \
    Source/ConfigShortcuts.h \
    Source/ConfigMIDI.h \
    Source/DialogReBar.h \
    Source/ConfigGeneral.h \
    Source/ConfigAppearance.h

symbian {
    MMP_RULES += EXPORTUNFROZEN
    TARGET.UID3 = 0xEABB3021
    TARGET.CAPABILITY =
    TARGET.EPOCALLOWDLLDATA = 1
    addFiles.sources = famitracker.dll
    addFiles.path = !:/sys/bin
    DEPLOYMENT += addFiles
}

win32 {
    HEADERS += stdafx.h
}

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}

unix:mac {
	# windows.h and co.
	NIX_CFLAGS = -I $$DEPENDENCYPATH/wine/include -DWINE_UNICODE_NATIVE

	# stdafx.h
	NIX_CFLAGS += -I $$DEPENDENCYPATH
	NIX_CFLAGS += -I $$DEPENDENCYPATH/stdafxhack
    #HEADERS += $$DEPENDENCYPATH/stdafx.h

	QMAKE_CFLAGS   += $$NIX_CFLAGS
	QMAKE_CXXFLAGS += $$NIX_CFLAGS
}

OTHER_FILES += \
    famitracker-lib.pro

FORMS +=

RESOURCES += \
    $$TOP/common/resource.qrc
