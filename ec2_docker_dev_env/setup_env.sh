sudo yum update -y                                     

# install docker

sudo amazon-linux-extras install docker -y

sudo service docker start                              

sudo usermod -a -G docker ec2-user                     
                     
sudo systemctl enable docker

# install docker-compose

sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null

sudo chmod +x /usr/local/bin/docker-compose

docker --version
docker-compose --version

# install git
sudo yum install git -y
git --version

# read from environment variables

git config --global user.name $GIT_USERNAME
git config --global user.name

git config --global user.email $GIT_EMAIL
git config --global user.email
