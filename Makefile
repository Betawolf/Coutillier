# 
# Makefile for Coutillier
# 
# Compiler: Mono C# Compiler.
# Author: Matthew Edwards 
#

BINDIR=./bin
CC=mcs
SOURCE=src/parser.cs
LIBS=-r:nrefact/ICSharpCode.NRefactory.dll -r:nrefact/ICSharpCode.NRefactory.CSharp.dll -r:nrefact/Mono.Cecil
RUNTIMELIBS=$(BINDIR)/ICSharpCode.NRefactory.dll $(BINDIR)/ICSharpCode.NRefactory.CSharp.dll $(BINDIR)/Mono.Cecil
EXE=$(BINDIR)/coutillier.exe
OUT=$(BINDIR)/coutillier

$(OUT) : $(EXE) $(RUNTIMELIBS)
	echo "#!/bin/bash" > $(OUT)
	echo "mono $(EXE) \$$@" >> $(OUT)
	chmod +x $(OUT)

$(EXE) : $(SOURCE)
	$(CC) $(LIBS) $(SOURCE) -out:$(EXE)

$(RUNTIMELIBS) :
	cp nrefact/*.dll $(BINDIR)

clean : 
	rm $(BINDIR)/*

