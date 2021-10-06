ifdef SystemRoot
	RM = del /Q
	EXT = dll
	JNILIB = SSCAPIJNI.dll
	ifneq (,$(findstring 64, $(value PROCESSOR_IDENTIFIER)))
		BITS = 64
		CCCOMP = c:/MinGW64/bin/gcc.exe
#Update based on your Java installation location		
 		CIFLAGS = -Wl,--kill-at -I"C:\Program Files\Java\jdk1.7.0_71\include"  -I"C:\Program Files\Java\jdk1.7.0_71\include\win32"
		JC = C:\Program Files\Java\jdk1.7.0_71\bin\javac.exe
		JAR = C:\Program Files\Java\jdk1.7.0_71\bin\jar.exe
		JAVA = C:\Program Files\Java\jdk1.7.0_71\bin\java.exe
		SSCLIB = ssc.dll
	else
		BITS = 32
		CCCOMP = c:/MinGW/bin/gcc.exe
#Update based on your Java installation location		
		CIFLAGS = -Wl,--kill-at -I"C:\Program Files(x86)\Java\jdk1.7.0_71\include"  -I"C:\Program Files(x86)\Java\jdk1.7.0_71\include\win32"
		JC = C:\Program Files (x86)\Java\jdk1.7.0_71\bin\javac.exe
		JAR = C:\Program Files (x86)\Java\jdk1.7.0_71\bin\jar.exe
		JAVA = C:\Program Files (x86)\Java\jdk1.7.0_71\bin\java.exe
		SSCLIB = ssc.dll
	endif	
else
    PF = $(shell uname)
    ifneq (,$(findstring Darwin, $(PF)))
        VERS = $(shell sw_vers -productVersion)
#Update based on your Java installation location
        CIFLAGS = -I/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home/include/darwin
        SSCLIB = ./ssc.dylib
        EXT = dylib
        JNILIB = libSSCAPIJNI.jnilib
        ifneq (,$(findstring 10.8, $(VERS) ))
            CIFLAGS = -I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers -I/System/Library/Frameworks/JavaVM.framework/Headers
	    SSCLIB = ssc.dylib
	    EXT = dylib
	    JNILIB = libSSCAPIJNI.jnilib
	else
            ifneq (,$(findstring 10.7, $(VERS) ))
                CIFLAGS = -I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers -I/System/Library/Frameworks/JavaVM.framework/Headers
	        SSCLIB = ssc.dylib
	        EXT = dylib
	        JNILIB = libSSCAPIJNI.jnilib
	    else
                ifneq (,$(findstring 10.6, $(VERS)))
	            CIFLAGS = -I/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Headers -I/Developer/SDKs/MacOSX10.6.sdk/System/Library/Frameworks/JavaVM.framework/Versions/A/Headers
                    SSCLIB = ssc.dylib
	            EXT = dylib
	            JNILIB = libSSCAPIJNI.jnilib
	        endif
	    endif
    	endif
    else 
        ifneq (,$findstring(Linux, $(PF)))
	    CIFLAGS = -I/usr/java/default/include -I/usr/java/default/include/linux -fPIC 
	    SSCLIB = ./ssc.so
	    EXT = so
	    JNILIB = libSSCAPIJNI.so
	    LIBPATH = -Djava.library.path=.
    	endif
    endif
    RM = rm -f
    CFLAGS += -D__64BIT__
    BITS = 64l
    JC = javac
    JAR = jar
    JAVA = java
    CCCOMP = gcc
endif
RM_JAVA = *.class  *.jar 
RM_ALL =  $(JNILIB)
PROJ_NAME =  untitled
JFLAGS = -g
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java
CLASSES = \
	SSCAPIJNI.java \
	$(PROJ_NAME).java
run: all
	$(JAVA) $(LIBPATH) -jar $(PROJ_NAME).jar
all: jar
java_all:  java_classes
java_classes: $(CLASSES:.java=.class)
jar: java_classes dll
	$(JAR) cvfm $(PROJ_NAME).jar $(PROJ_NAME).Manifest.txt $(PROJ_NAME).class SSCAPIJNI.class 	
java_clean:
	$(RM) $(RM_JAVA)
# $@ matches the target, $< matches the first dependancy
dll : 
	$(CCCOMP) -D_JNI_IMPLEMENTATION_  $(CIFLAGS) -shared sscapijni.c -o $(JNILIB) $(SSCLIB)
clean :
	$(RM) $(RM_ALL) $(RM_JAVA)
help:
	@echo "Please check the settings for your system.Your system may not be supported.Please contact sam.support@nrel.gov.System: $(PF) $(VERS)"
