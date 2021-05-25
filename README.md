# DockerDOGE
## Dockerfiles for building Dogecoin-Core

### Functioning Branches
- [x] `Working` **1.14.4-dev**
- [ ] `In progress` **1.17-dev**
- [ ] `In progress` **1.18-dev**
- [ ] `In progress` **1.21-dev**

### Functioning builds
- [x] **arm-linux-gnueabihf** | NO_QT |
- [x] **aarch64** (ERROR: QT dependencies not found)
- [x] **Windows-x86_64**
- [x] **linux-x86_64**
- [ ] **OSX-x86_64** (ERRORS: Needs work)

```
git clone https://github.com/dogecoin/dogecoin.git dogecoin-release && cd dogecoin-release
git checkout 1.14.4-dev
cd ..
git clone https://github.com/vertiond/DockerDOGE.git && cd DockerDOGE
find . -type f -iname "*.sh" -exec chmod +x {} \;
./dockerBuild.sh
sudo ./release.sh
```
By default, all builds will be compiled.  You may specify a specific build by editing the release.sh file.  Every time you edit a build file, you must re-run dockerBuild.sh before release.sh.
