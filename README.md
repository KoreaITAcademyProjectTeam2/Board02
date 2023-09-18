<h1>b o a r d 0 2</h1>

<h2>폴더 구조</h3>
 <h3>- com.thread.controller </h3>
      컨트롤러(Controller)는 클라이언트의 요청을 처리하고 응답을 생성하는 역할을 합니다. <br>
      주로 URL 매핑, 사용자 입력의 유효성 검사, 서비스 계층과의 상호작용 등을 담당합니다. <br>
      클라이언트로부터 요청을 받아 해당 요청에 대한 처리를 서비스 계층에 위임하고, 서비스로부터 반환된 데이터를 화면으로 전달하여 뷰를 렌더링합니다. <br>
      Spring MVC에서 컨트롤러는 @Controller 어노테이션을 사용하여 정의하며, 주로 웹 요청을 처리하는 메서드를 가지고 있습니다.
<h3>- com.thread.domain </h3>
      도메인(Domain) 또는 모델(Model)은 애플리케이션의 핵심 데이터 구조를 정의하는 곳입니다. <br>
      이 폴더에는 데이터베이스의 테이블과 매핑되는 엔티티 클래스들이 포함됩니다. <br>
      엔티티 클래스들은 데이터베이스 테이블의 레코드를 나타내고, 비즈니스 로직을 포함할 수도 있습니다.
<h3>- com.thread.mapper </h3>
      매퍼(Mapper)는 데이터베이스와의 상호작용을 담당하는 역할을 합니다. <br>
      주로 MyBatis, Hibernate 등의 ORM(Object-Relational Mapping) 프레임워크를 사용하여 데이터베이스 쿼리와 엔티티 객체 간의 매핑을 처리합니다. <br>
      SQL 쿼리나 데이터베이스 접근 로직을 이곳에서 작성하고 관리합니다. <br>
      데이터베이스와 관련된 작업을 모델 계층으로부터 분리하여 데이터베이스 변경에 대한 영향을 최소화합니다.
<h3>- com.thread.service </h3>
      서비스(Service) 계층은 비즈니스 로직을 수행하는 역할을 합니다. <br>
      컨트롤러로부터 받은 요청을 처리하고, 필요한 데이터를 도메인 계층에서 가져와 비즈니스 로직을 적용합니다. <br>
      서비스 계층은 트랜잭션 관리와 같은 핵심 비즈니스 로직을 포함하며, 다수의 매퍼와 도메인 객체를 조합하여 작업을 수행합니다.
