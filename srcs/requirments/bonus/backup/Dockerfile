from debian:buster

run apt update
run apt -y install bash tar

copy tools/entry.sh /
run mkdir data database

ENTRYPOINT ["bash", "entry.sh"]
CMD [""]