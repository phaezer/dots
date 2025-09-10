#! /bin/bash

echo "Installing Kanata launchd services..."

CWD=$(pwd)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PLIST_DIR="$SCRIPT_DIR/plist"
INSTALL_DIR="/Library/LaunchDaemons"
PLIST_FILES=(
    "com.phaezer.kanata.plist"
    "com.phaezer.karabiner-vhiddaemon.plist"
    "com.phaezer.karabiner-vhidmanager.plist"
)

if [[ $EUID -ne 0 ]]; then
    echo "must be run as root"
    exit 1
fi

if [[ "$CWD" != "$SCRIPT_DIR" ]]; then
    pushd "$SCRIPT_DIR" \
    || echo "could not cd to $SCRIPT_DIR" \
    && exit 2
fi

function bail_out {
    # uninstall any plists that were installed
    for PLIST in "${PLIST_FILES[@]}"; do
        if [[ -f "$INSTALL_DIR/$PLIST" ]]; then
            launchctl unload "$INSTALL_DIR/$PLIST"
            rm "$INSTALL_DIR/$PLIST"
            echo "uninstalled $PLIST"
        fi
    done

    cd "$CWD"
    exit "${1:-1}"
}

echo "installing plist files to $INSTALL_DIR"
for PLIST in "${PLIST_FILES[@]}"; do
    cp "$PLIST_DIR/$PLIST" "$INSTALL_DIR" || bail_out 3
    echo "installed $PLIST"
    launchctl bootstrap system "$INSTALL_DIR/$PLIST" && \
    launchctl enable system/"$PLIST"

    if [[ $? -ne 0 ]]; then
        echo "failed to bootstrap or enable $PLIST"
        bail_out 4
    else
        echo "bootstrapped and enabled $PLIST"
    fi
done

launchctl start com.phaezer.karabiner-vhiddaemon && \
launchctl start com.phaezer.karabiner-vhidmanager && \
launchctl start com.phaezer.kanata

if [[ $? -ne 0 ]]; then
    echo "failed to start kanata services"
    bail_out 5
else
    echo "started kanata services"
fi

cd "$CWD"