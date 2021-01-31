      -- Mysql 建表语句，注意这是在Mysql执行的
      CREATE TABLE `dim_behavior` (
      `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
      `en_behavior` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文 行为',
      `zh_behavior` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '中文 行为',
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



      -- Mysql插入两条数据
      INSERT INTO `dijie_test`.`dim_behavior`(`id`, `en_behavior`, `zh_behavior`) VALUES (1, 'buy', '购买');
      INSERT INTO `dijie_test`.`dim_behavior`(`id`, `en_behavior`, `zh_behavior`) VALUES (2, 'pv', '浏览');



---下面在flink sql client中操作
    CREATE TABLE `dim_behavior` (
      `id` int  ,
      `en_behavior` varchar  ,
      `zh_behavior` varchar  
    )WITH (
      'connector.type' = 'jdbc',
      'connector.url' = 'jdbc:mysql://Desktop:3306/dijie_test',
      'connector.table' = 'dim_behavior',
      'connector.driver' = 'com.mysql.jdbc.Driver', 
      'connector.username' = 'appleyuchi',
      'connector.password' = 'appleyuchi' ,
      'connector.lookup.cache.max-rows' = '5000', 
      'connector.lookup.cache.ttl' = '10s'  
    );


create temporary function scalaupper as 'org.apache.zeppelin.flink.udf.ScalaUpper';


select scalaupper(en_behavior) from dim_behavior;