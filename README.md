# 비전공자도 이해할 수 있는 CI/CD 입문·실전 실습 자료

비전공자도 이해할 수 있는 CI/CD 입문·실전

 - [비전공자도 이해할 수 있는 CI/CD 입문·실전](https://inf.run/YNRSF)
 - Github Actions 기본 개념
 - Spring Boot 프로젝트에 CI/CD 적용

###

### 방법 1 - 개인 프로젝트에서 많이 쓰는 CI/CD 구축 방법 (Github Actions)

<img src="image/method1.png"  width="450"/><br>
 - method/deploy_method1.yml
 - deploy_method1.yml 를 workflows 하위에 이동 시켜 적용

#### ✅ 장점
 - git pull을 활용해서 변경된 부분의 프로젝트 코드에 대해서만 업데이트 하기 때문에 CI/CD 속도가 빠르다.
   - 대부분의 CI/CD 방식들은 전체 프로젝트를 통째로 갈아끼우는 방식을 사용한다.
 - CI/CD 툴로 Github Actions만 사용하기 때문에 인프라 구조가 복잡하지 않고 간단하다.

#### ✅ 단점
 - 빌드 작업을 EC2에서 직접 진행하기 때문에 운영하고 있는 서버의 성능에 영향을 미칠 수 있다.
 - Github 계정 정보가 해당 EC2에 저장되기 때문에 개인 프로젝트 또는 믿을만한 사람들과 같이 진행하는 토이 프로젝트에서만 사용해야 한다.

#### ✅ 이 방법은 언제 주로 쓰는 지
 - 주로 개인 프로젝트에서 CI/CD를 심플하고 빠르게 적용시키고 싶을 때 적용한다.

###

### 방법 2 - 일반 프로젝트에서 많이 쓰는 CI/CD 구축 방법 (Github Actions, SCP)

<img src="image/method2.png"  width="450"/><br>
 - method/deploy_method2.yml
 - deploy_method2.yml 를 workflows 하위에 이동 시켜 적용

#### ✅ 장점
 - 빌드 작업을 Github Actions에서 하기 때문에 운영하고 있는 서버의 성능에 영향을 거의 주지 않는다.
 - CI/CD 툴로 Github Actions만 사용하기 때문에 인프라 구조가 복잡하지 않고 간단하다.

#### ✅ 단점
 - 무중단 배포를 구현하거나 여러 EC2 인스턴스에 배포를 해야 하는 상황이라면, 직접 Github Actions에 스크립트를 작성해서 구현해야 한다. 직접 구현을 해보면 알겠지만 생각보다 꽤 복잡하다.

#### ✅ 이 방법은 언제 주로 쓰는 지
 - 현업에서 초기 서비스를 구축할 때 이 방법을 많이 활용한다.
   - 처음 서비스를 구현할 때는 대규모 서비스에 적합한 구조로 구현하지 않는다. 즉, 오버 엔지니어링을 하지 않는다. 확장의 필요성이 있 다고 느끼는 시점에 인프라를 고도화하기 시작한다. 왜냐하면 복잡한 인프라 구조를 갖추고 관리하는 건 생각보다 여러 측면에서 신경 쓸 게 많아지기 때문이다.
     - 인프라 구조를 변경할 때 시간이 많이 들어감
     - 에러가 발생했을 때 트러블 슈팅의 어려움
     - 팀원이 인프라 구조를 이해하기 어려워 함
     - 기능을 추가하거나 수정할 때 더 많은 시간이 들어감
     - 금전적인 비용이 더 많이 발생

###

### 방법 3 - 확장성을 고려한 프로젝트에서 많이 쓰는 CI/CD 구축 방법 (Code Deploy)
<img src="image/method3.png"  width="450"/><br>
 - method/deploy_method3.yml
 - deploy_method3.yml 를 workflows 하위에 이동 시켜 적용

#### ✅ 장점
 - 서버가 여러 대이더라도 쉽게 자동 배포를 구축할 수 있다.
 - 쉽게 무중단 배포를 적용시킬 수 있다.

#### ✅ 단점
 - CodeDeploy를 사용함으로써 인프라 구조가 복잡해졌다. 구조가 복잡해짐에 따라 관리 비용, 유지보수 비용, 난이도, 트러블 슈팅 어려 움, 복잡도가 증가했다.

#### ✅ 이 방법은 언제 주로 쓰는 지
 - 서버를 여러 대 이상 구동해야 하거나 무중단 배포가 중요한 서비스일 때 주로 활용한다.

###

### 방법 4 - 컨테이너 기반의 프로젝트에서 많이 쓰는 CI/CD 구축 방법 (Docker)
<img src="image/method4.png"  width="450"/><br>
 - method/deploy_method4.yml
 - deploy_method4.yml 를 workflows 하위에 이동 시켜 적용

#### ✅ 장점
 - Docker 기반으로 서비스를 운영할 때, 가장 간단하게 구성할 수 있는 인프라 구조이다.

#### ✅ 단점
 - 무중단 배포를 구현하거나 여러 EC2 인스턴스에 배포를 해야 하는 상황이라면, 직접 Github Actions에 스크립트를 작성해서 구현해야 한다. 직접 구현을 해보면 알겠지만 생각보다 꽤 복잡하다.

#### ✅ 이 방법은 언제 주로 쓰는 지
 - 컨테이너 기반으로 인프라를 구성했을 때 이 방법을 많이 활용한다.
 - 서버를 여러 대 운영하고 있지 않을 정도의 소규모 프로젝트 일 때 주로 활용한다.

###

### 방법 5 - 컨테이너 기반 + 확장성을 고려한 프로젝트에서 많이 쓰는 CI/CD 구축 방법 (Docker, CodeDeploy)

<img src="image/method5.png"  width="450"/><br>
 - method/deploy_method5.yml
 - deploy_method5.yml 를 workflows 하위에 이동 시켜 적용

#### ✅ 장점
 - 컨테이너 기반의 서버가 여러 대이더라도 쉽게 자동 배포를 구축할 수 있다.
 - 쉽게 무중단 배포를 적용시킬 수 있다.

#### ✅ 단점
- CodeDeploy를 사용함으로써 인프라 구조가 복잡해졌다. 구조가 복잡해짐에 따라 관리 비용, 유지보수 비용, 난이도, 트러블 슈팅 어려 움, 복잡도가 증가했다.

#### ✅ 이 방법은 언제 주로 쓰는 지
- 컨테이너 기반의 서버를 여러 대 이상 구동해야 하거나 무중단 배포가 중요한 서비스일 때 주로 활용한다.

