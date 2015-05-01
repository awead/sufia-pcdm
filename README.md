# Sufia LDP in Action

This is a variation of [LDP-PCDM-F4 In Action](https://wiki.duraspace.org/display/FEDORA4x/LDP-PCDM-F4+In+Action) that
represents a Sufia-based application on Fedora 4.

## What is this?

This is my attempt to understand what a Sufia-PCDM-appoved application would look like in Fedora. There's no Ruby code here, it's strictly a "staw man"
made up of curl requests, RDF, and some actual data that's made up to be like what Sufia creates, i.e. binary data, thumbnail images, and FITS xml
characterization information.

## Why did you do this?

I'm confused about this LDP and PCDM stuff. I want to see if this holds up to what we're tying to model in Sufia.

## What do you want me to do with this?

Nothing, really. But, if you want to see if my understanding jives with your understanding, then...

## To Use

1. Spin-up any Fedora 4 hydra-jetty instance. If you don't have one, then:
    
    ```
    git clone https://github.com/projecthydra/hydra-jetty
    cd hydra-jetty
    java -Xmx512m -XX:MaxPermSize=512m -jar start.jar
    ```

1. Clone this repo

    git clone https://github.com/awead/sufia-pcdm

1. Run the single-file example

    ./single-file-work.sh

1. Explore [localhost:8983/fedora/rest/dev](localhost:8983/fedora/rest/dev)

1. Run the multi-file example
    
    ./multi-file-work

1. Explore [localhost:8983/fedora/rest/dev](localhost:8983/fedora/rest/dev)

1. Tell me if I'm wrong
