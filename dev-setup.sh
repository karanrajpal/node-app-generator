# This script is meant to setup your local environment if you are planning to contribute to this repository
printf "Installing lots of node modules..."
npm install react redux react-redux typescript typescript-fsa express sass react-router-dom react-dom
if [ $? = 0 ]; then
    printf "Your dev environment was setup successfully. Contribute well\n"
else
    printf "Something went wrong with the setup. Dang...\n"
fi
