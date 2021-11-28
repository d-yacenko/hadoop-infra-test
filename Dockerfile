FROM anapsix/alpine-java

EXPOSE 8080 

ENV GROOVY_VERSION=2.4.5.4 
RUN mkdir "/usr/lib/hadoop_test" && \
    wget "https://github.com/d-yacenko/hadoop-api-test/raw/main/output_package/pkg.zip" -O /usr/lib/hadoop_test/package.zip && \
    unzip /usr/lib/hadoop_test/package.zip -d /usr/lib/hadoop_test/ && \
    cp -f /usr/lib/hadoop_test/hosts /etc/hosts

ENTRYPOINT ["java","-cp","/usr/lib/hadoop_test/test-0.0.1-SNAPSHOT-jar-with-dependencies.jar:/usr/lib/hadoop_test/lib/*","ru.arena.hadoop.test.App"]

CMD ["--help"]
