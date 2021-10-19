RM = del /Q
EXT = dll
JNILIB = SSCAPIJNI.dll
BITS = 64
CCCOMP = C:/msys64/mingw64/bin/gcc.exe

CIFLAGS = -Wl,--kill-at -I"C:\Java\jdk-11.0.11\include"  -I"C:\Java\jdk-11.0.11\include\win32"
JC = C:\Java\jdk-11.0.11\bin\javac.exe
JAR = C:\Java\jdk-11.0.11\bin\jar.exe
JAVA = C:\Java\jdk-11.0.11\bin\java.exe
SSCLIB = ssc.dll

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
