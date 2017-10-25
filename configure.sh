#!/bin/bash

git clone https://github.com/apache/samza.git
cd samza
./gradlew clean compileJava compileScala
