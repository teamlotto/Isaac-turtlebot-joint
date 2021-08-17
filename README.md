# Joint Simlation Test In the Isaac Sim
![image](https://user-images.githubusercontent.com/69780812/129684858-3f419102-8771-471f-be49-131a6d89581c.png)
## Reference
- https://docs.omniverse.nvidia.com/app_isaacsim/app_isaacsim/sample_ros_turtlebot.html
## PREPARATION
- ros-melodic
  - ROS Master (Server, 로컬 환경에서 roscore 실행) 
  - ROS Client (Client, 도커 컨테이너 Isaac-sim 환경)
  - Serever에 turtlebot3 패키지들이 다운로드 되어있어야합니다.
    - ```shell
      sudo apt-get install ros-melodic-turtlebot3
      ```
- Custom docker container
  - isaac-sim nvcr.io docker ([참고링크](https://docs.nvidia.com/ngc/ngc-overview/index.html#generating-api-key)) 기반 isaac-sdk, ros-melodic을 설치한 도커 이미지입니다.
  - [Our Team's Docker Hub](https://hub.docker.com/orgs/lottoworld777/repositories)
  - ![image](https://user-images.githubusercontent.com/69780812/129685629-71147ca7-b776-4600-a402-25bc2de71ac0.png)
- Model
  - turtlebot burger
- 현재 Repository를 git clone 해주세요.

## My Running Order
```shell
cd Isaac-turtlebot-joint
```
### 1. Urdf 파일을 준비하라.
```shell
cd run_docker_container/job_in_docker/turtlebot3_description/urdf
rosrun xacro xacro -o turtlebot3_burger.urdf turtlebot3_burger.urdf.xacro
```
- xacro 파일을 urdf 로 변환합니다.
- 변환 후 urdf 파일은 urdf 폴더 내에 둬줘야합니다. (정확한 이유는 모르겠지만 팀원(enji)이 말하길, 아이작 심에서 Import 할 때 연동되는 프로그램을 찾는데, 다른 곳에 있으면 터미널에서 에러가 발생한다고 합니다.)
  - 저도 밖에있는 urdf를 가져왔을 때 Isaac-Sim 프로그램이 비정상적으로 종료됐습니다.
### 2. Custom Docker Image를 Container로 올려라.
```shell
cd run_docker_container
sh start-isaac-sim-with-meldoic.sh
```
### 3. Urdf를 Import 하라.
- Uncheck “Merge Fixed Joints”
- **Uncheck “Fix Base Link” in the importing settings.**
- Under Parser set the joint drive type to Velocity so that wheels can be properly driven later

![image](https://user-images.githubusercontent.com/69780812/129714968-4b523c10-6812-4123-9cbc-3dfdf13d3491.png)
- Select and Parse URDF를 클릭합니다.
- **Joint Drive Type은 Velocity로 해줍니다.**

![image](https://user-images.githubusercontent.com/69780812/129696019-1e9881ad-4e0d-43ca-8a54-5b78acbc3492.png)
- urdf를 선택합니다.

![image](https://user-images.githubusercontent.com/69780812/129696712-833bb079-2a53-4988-ba50-0f5f8199b584.png)
- Import Robot to Stage를 클릭해서 스테이지에 올립니다.

![image](https://user-images.githubusercontent.com/69780812/129696283-6b749a83-2352-400b-9b3f-61e4a4bfa494.png)

### 4. Ground Plane 추가
- 로봇이 drive하기 위해 Plane이 필요합니다.
- 위 좌상단 메뉴 > Create > Physics > Ground Plane Click

![image](https://user-images.githubusercontent.com/69780812/129697549-29645a99-2552-47f5-b2a2-772f8d536756.png)
- 오른쪽 패널에서 Ground Plane을 /World 로 Drag 해서 넣어줍니다.

![image](https://user-images.githubusercontent.com/69780812/129696985-a328d175-4d95-40a6-8d2c-dc51c93b9c51.png)

### 5. Material 추가
![image](https://user-images.githubusercontent.com/69780812/129697424-59b68b79-d1e7-4d61-84b7-6e60a17606b2.png)
- 이름을 더블 클릭해서 Rear Slider 로 바꿔주고, Friction Combine Mode를 min으로 해줍니다.

### 6. collisions cube Material을 바꿔주자.
![image](https://user-images.githubusercontent.com/69780812/129698379-51fcb75f-05c6-4a5a-8607-a0b07deb16ee.png)
- physics material을 위에 만든 Rear slider로 변경해줍니다.

### 7. Control
#### 7-1 Isaac-sim에서 작동시켜보기
![image](https://user-images.githubusercontent.com/69780812/129699830-8ad07410-26a0-4cca-9133-7db24d0b4015.png)
- wheel_left_joint, wheel_right_joint 모두 Target Velocity를 설정해주세요.
- Dampping을 높은 값으로 설정해주세요. 너무 작으면 움직이지 않고, 동작이 불안정 합니다.
- 
![isaac-sim-joint-example](https://user-images.githubusercontent.com/69780812/129699694-72f1e6c4-6053-483e-9a8e-cecc477bc285.gif)

#### 7-2 Ros로 작동시켜보기
- 실행 중인 시뮬레이션이 있으면 Stop 해줍니다.
- 오른쪽 메뉴의 turtlebot3_burger prime을 선택합니다.

- ![image](https://user-images.githubusercontent.com/69780812/129701412-72e3f6ad-1b81-4957-a3e0-731bed566ba1.png)
- Create > Isaac > ROS > Joint State
![image](https://user-images.githubusercontent.com/69780812/129701015-d9925dc7-3397-44d4-aa69-ff0ddbb406c9.png)

- ROS_JointState Click > Raw USD Properties > articulationPrime Add target
```shell
roscore
```
- Server 에서 roscore를 실행해줍니다.
- Docker Isaac Sim의 Play를 눌러 준 후 rostopic list의 변화를 확인합니다.
- ![image](https://user-images.githubusercontent.com/69780812/129701602-1dfcc05e-3cd1-494c-a6ec-53b2e0c57e39.png)

```shell
cd joint_test_ws
source devel/setup.bash 
rosrun isaac-turtlebot-joint turtlebot3_burger_joint.py
```
![isaac-sim-joint-example-ros](https://user-images.githubusercontent.com/69780812/129715949-8f95a228-7d53-4a96-92d9-a11d3bb9869c.gif)

