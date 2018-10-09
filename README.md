[![Build Status](https://travis-ci.org/Dids/clobber.svg?branch=master)](https://travis-ci.org/Dids/clobber)

# Clobber

```
 ___    _      _____  ___    ___    ___    ___
(  _`\ ( )    (  _  )(  _`\ (  _`\ (  _`\ |  _`\
| ( (_)| |    | ( ) || (_) )| (_) )| (_(_)| (_) )
| |  _ | |  _ | | | ||  _ <'|  _ <'|  _)_ | ,  /
| (_( )| |_( )| (_) || (_) )| (_) )| (_( )| |\ \
(____/'(____/'(_____)(____/'(____/'(____/'(_) (_)
                                         by @Dids
```

Clobber is command-line application for building [Clover](https://sourceforge.net/projects/cloverefiboot/).

### Requirements

- [macOS](https://www.apple.com/lae/macos/) (only tested on macOS High Sierra)
- [Xcode](https://developer.apple.com/xcode/) (available on the App Store)
- [Homebrew](https://brew.sh/)

Note that when you run `clobber` for the first time, it may prompt you to install [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html), saying `javac` is missing, but you can safely ignore this prompt.  
The reason for this prompt comes from building `gettext`, so it's an unfortunate side effect that we can't do anything about.

### Installation

> brew tap Dids/brewery  
> brew install clobber  

### Usage

Build the latest version of Clover:  
> clobber  

Build a specific Clover version/revision:  
> clobber --revision 1234  

View all the available options:  
> clobber --help  

### Development

Install `dep`:  
> curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh  

Install dependencies:  
> dep ensure  

Run the application:  
> go run main.go  

Run tests:  
> go test ./...  

Creating new `buildpkg.sh` patches:  
1. Make a copy of `buildpkg.sh` and name it `buildpkg_patched.sh` (it can be found in `~/.clobber/src/edk2/Clover/CloverPackage/package`)  
2. Make the required changes to `buildpkg_patched.sh`  
3. Create a new patch with the following command:  
   > `diff -Naru ~/.clobber/src/edk2/Clover/CloverPackage/package/buildpkg.sh ~/.clobber/src/edk2/Clover/CloverPackage/package/buildpkg_patched.sh > patches/buildpkg.patch`  

Creating new `ebuild.sh` patches:  
1. Make a copy of `ebuild.sh` and name it `ebuild_patched.sh` (it can be found in `~/.clobber/src/edk2/Clover`)  
2. Make the required changes to `ebuild_patched.sh`  
3. Create a new patch with the following command:  
   > `diff -Naru ~/.clobber/src/edk2/Clover/ebuild.sh ~/.clobber/src/edk2/Clover/ebuild_patched.sh > patches/ebuild.patch`  

### License

See [LICENSE](LICENSE).
