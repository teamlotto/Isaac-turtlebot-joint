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
## My Running Order
### 1. Urdf 파일을 준비하라.
