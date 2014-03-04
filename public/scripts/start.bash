export outp=`curl http://glacial-anchorage-8546.herokuapp.com/start`
while [ $outp != START ]; do
  echo Nope;
  sleep 15;
  export outp=`curl http://glacial-anchorage-8546.herokuapp.com/start`
done
