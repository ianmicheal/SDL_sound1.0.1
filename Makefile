# KallistiOS ##version##
# SDL_sound ported by Ian Micheal
# SDL_sound Makefile
# Ian Micheal
#
# and
# Makefile.dc found in SDL_mixer-1.2.4 by BERO
#

#max=1

KOS_CFLAGS += -Iinclude -Isrc -Isrc/audio -Isrc/cdrom -Isrc/endian
KOS_CFLAGS += -Isrc/events -Isrc/joystick -Isrc/thread/dc -Isrc/thread -Isrc/timer
KOS_CFLAGS += -Isrc/video -DNO_SIGNAL_H -DENABLE_DC

ifdef max
KOS_CFLAGS += -DHAVE_KGL
TARGET = libSDL_soundmax.a
else
TARGET = libSDL_sound.a
endif

OBJS = \
	SDL_sound.o	\
    alt_audio_convert.o   \
    audio_convert.o   \
	extra_rwops.o	\
	decoders\mpglib\mpglib_common.o     \
	decoders\mpglib\layer1.o            \
	decoders\mpglib\tabinit.o          \
	decoders\mpglib\dct64_i386.o        \
	decoders\mpglib\interface.o         \
	decoders\mpglib\layer2.o           \
	decoders\mpglib\decode_i386.o       \
	decoders\mpglib\layer3.o            \


myall: $(OBJS)
	rm -f $(KOS_BASE)/lib/libSDL_sound.a
	$(KOS_AR) rcs $(KOS_BASE)/lib/libSDL_sound.a $(OBJS)

include $(KOS_BASE)/Makefile.prefab

