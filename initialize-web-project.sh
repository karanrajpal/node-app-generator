#!/bin/bash
printf "Welcome to the New Web Project Setup Wizard!!\n"
printf "Rollup your sleeves to make some simple choices and you'll be on your way soon. Remember [Enter] is yes.\n"
printf "Your project will be created a level up from where you're running this script\n"
printf "Name of project: "
read -r project_name
while [[ $project_name = '' ]]; do
    printf "Sorry. Your project needs a name!\n"
    printf "Name of project: "
    read project_name
done

PROJECT_PATH=../$project_name
while [[ -d $PROJECT_PATH ]]; do
    printf "Sorry. There already exists a project with the same name. Try again!\n"
    printf "Name of project: "
    read project_name
done

mkdir $PROJECT_PATH && cd $PROJECT_PATH
npm init -y

printf "Yo, do you want to setup a client folder [y/n]: "
read -r confirmation
if [ $confirmation = ''] || [ $confirmation = 'y' ] || [ $confirmation = 'Y' ]
then
    mkdir client
    printf "Cool. This wizard only has opinions about a React+Redux client project. Do you want it [y/n]: "
    read -r confirmation
    if [ $confirmation = ''] || [ $confirmation = 'y' ] || [ $confirmation = 'Y' ]
    cd client
        echo "Insert your main index.html content here and include index.js" > index.html
        echo "Include your App.ts file here" > index.html
        mkdir -p client/components client/state
        echo "This is " client/components/App.tsx
fi


printf "Hooray, it's now time to choose from your favorite npm packages!\n"
packages_to_install=()
printf "Install Build tool Parcel [y/n]: "
read -r confirmation
if [ $confirmation = ''] || [ $confirmation = 'y' ] || [ $confirmation = 'Y' ]
then
    packages_to_install+=('parcel')
fi

printf "Install React [y/n]: "
read -r confirmation
if [ $confirmation = ''] || [ $confirmation = 'y' ] || [ $confirmation = 'Y' ]
then
    packages_to_install+=('react')
fi

printf "Install Redux [y/n]: "
read -r confirmation
if [ $confirmation = ''] || [ $confirmation = 'y' ] || [ $confirmation = 'Y' ]
then
    packages_to_install+=('redux')
    packages_to_install+=('react-redux')
fi

printf "Install Express [y/n]: "
read -r confirmation
if [ $confirmation = ''] || $confirmation = 'y' ] || [ $confirmation = 'Y' ]
then
    packages_to_install+=('express')
fi

printf "Got it. Setting up your node dependencies. Standby as we contact the internet...\n\n\n"
for package in "${packages_to_install[@]}"
do
    npm install $package
done

if [ $? = 0 ]; then
    printf "Your project was setup successfully. Go change the world with it!\n"
else
    printf "Something went wrong with the setup. Don't worry, you can still do great things after you debug...\n"
fi