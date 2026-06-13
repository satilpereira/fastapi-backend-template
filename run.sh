# run.sh

## When sh run.sh help is called, print the usage message and exit
if [ "$1" = "help" ] || [ "$1" = "" ]; then
    echo "Usage: sh run.sh [options]"
    echo "Options:"
    echo "  help        Show this help message and exit"
    echo "  build       Build the project"
    echo "  deps        Install the dependencies (Only needed for the first time)"
    echo "  clean       Clean the build artifacts"
    echo "  test        Run the tests"
    exit 0
fi

if [ "$1" != "help" ] && [ "$1" != "build" ] && [ "$1" != "deps" ] && [ "$1" != "clean" ] && [ "$1" != "test" ]; then
    echo "Invalid option: $1"
    echo "Use 'sh run.sh help' to see the usage message"
    exit 1
fi