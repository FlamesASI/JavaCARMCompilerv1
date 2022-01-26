

javac $1 2>&1 | grep -v "error" > "/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/javac.log"
if [ $? -eq 0 ]; then
echo "Compilation successful!"
else
echo "Would you like to install javac compiler from java jdk website?
y/n"
read answer
if [ $answer = "y" ]; then
echo "Installing javac compiler from java jdk website..."
## write a installer that fetches the java jdk arm installer
## and installs it
else
echo "Downloading"
## download the mac os arm java installer
## download "https://download.oracle.com/java/17/latest/jdk-17_macos-aarch64_bin.dmg"
wget https://download.oracle.com/java/17/latest/jdk-17_macos-x64_bin.dmg
echo "Installing"
## install the java jdk
hdiutil attach jdk-17_macos-x64_bin.dmg
sudo installer -pkg /Volumes/JDK-17/JDK-17.pkg -target /
echo "Installed"
echo "Compiling"
javac $1 2>&1 | grep -v "error" > "/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/javac.log"
echo "Compiled"


## unmount the dmg
hdiutil detach /Volumes/JDK-17/

 
## compile it to your applications folder
gcc -std=gnu99 -o $2 $1 2>&1 | grep -v "error" > "/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/gcc.log"
fi
fi