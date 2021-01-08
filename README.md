# DockerDOGE
## Dockerfiles for building Dogecoin-Core

### Functioning Branches
- [x] `Working` **1.14.3-dev**
- [ ] `In progress` **1.15-dev**
- [ ] `In progress` **1.16-dev**
- [ ] `In progress` **1.17-dev**

### Supported builds
- [x] **arm-linux-gnueabihf** | NO_QT |
- [x] **aarch64** 
- [x] **Windows-x86_64**
- [x] **linux-x86_64**
- [x] **OSX-x86_64**

```
git clone https://github.com/Vertian/dogecoin.git dogecoin-release && cd dogecoin-release
git checkout 1.14.3-dev
cd ..
git clone https://github.com/Vertian/DockerDOGE.git && cd DockerDOGE
./dockerBuild.sh
./release.sh
```
By default, all builds will be compiled.  You may specify a specific build by editing the release.sh file.  If you ever edit a specific build file, you must re-run dockerBuild.sh before release.sh.
