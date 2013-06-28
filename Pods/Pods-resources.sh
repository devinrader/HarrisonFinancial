#!/bin/sh

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy.txt
touch "$RESOURCES_TO_COPY"

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "rsync -rp ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -rp "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename $1 .xcdatamodeld`.momd"
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename $1 .xcdatamodeld`.momd"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
install_resource 'TwilioSDK/Twilio/Resources/disconnect.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_0.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_1.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_2.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_3.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_4.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_5.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_6.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_7.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_8.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_9.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_hash.wav'
install_resource 'TwilioSDK/Twilio/Resources/dtmf_star.wav'
install_resource 'TwilioSDK/Twilio/Resources/incoming.wav'
install_resource 'TwilioSDK/Twilio/Resources/outgoing.wav'

rsync -avr --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rm "$RESOURCES_TO_COPY"
