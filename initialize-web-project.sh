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

printf "Initialize empty git repository [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    git init
fi

printf "Hooray, it's now time to choose from your favorite npm packages!\n"
packages_to_install=()
printf "Install Build tool Parcel [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    packages_to_install+=('parcel')
fi

printf "Install React [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    packages_to_install+=('react')
    packages_to_install+=('react-dom')
fi

printf "Install Redux [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    packages_to_install+=('redux')
    packages_to_install+=('react-redux')
fi

printf "Install react-router-dom [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    packages_to_install+=('react-router-dom')
fi

printf "Install Typescript [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    packages_to_install+=('typescript')
fi

printf "Install Typescript-fsa [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    packages_to_install+=('typescript-fsa')
fi

printf "Install Sass [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    packages_to_install+=('sass')
fi

printf "Install Express [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    packages_to_install+=('express')
fi
printf "Ok, interesting choices...\n"

printf "Yo, do you want to setup a client folder [y/n]: "
read -r confirmation
if [[ $confirmation = '' ]] || [[ $confirmation = 'y' ]] || [[ $confirmation = 'Y' ]]; then
    mkdir client
    printf "Cool. This wizard has the following client templates \n"
    printf "
        0) Empty
        1) React + Redux + React Router in Typescript\n\n"
    printf "Pick the boilerplate template you want to setup your client folder with [0-1]: "
    read -r confirmation
    case "$confirmation" in
    "1")
        cp -r ../quick-webapp-generator/templates/react-redux-with-router/ client/
        ;;
    esac
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