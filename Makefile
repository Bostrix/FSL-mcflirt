 #Specify the default compiler
CXX = g++

#Specify the -fpic flag
CXXFLAGS += -fpic

#Additional LDFLAGS for znzlib library
ZNZLIB_LDFLAGS = -L/path/to/yor/znzlib/directory/ -lfsl-znz

#Define source files
SRCS = Globaloptions.cc Log.cc mcflirt.cc

#Define object files
OBJS = $(SRCS:.cc=.o)

#Define library source files and directories
LIB_DIRS = miscmaths newimage NewNifti utils cprob znzlib
LIB_SRCS = $(foreach dir,$(LIB_DIRS),$(wildcard $(dir)/*.cc))
LIB_OBJS = $(LIB_SRCS:.cc=.o)

#Define targets
all: mcflirt

#Compile the final executable
mcflirt: libraries $(OBJS) $(LIB_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(LIB_OBJS) $(LDFLAGS) $(ZNZLIB_LDFLAGS)  -lblas -llapack -lz

#Rule to build object files
%.o: %.cc
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#Phony target to build all libraries
.PHONY: libraries
libraries:
	@for dir in $(LIB_DIRS); do \
	$(MAKE) -C $$dir CXX=$(CXX) CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)'; \
	done

#Clean rule
clean:
	rm -f mcflirt $(OBJS) $(LIB_OBJS)
