cask 'roland-quad-capture-usb-driver' do
  if MacOS.version <= :yosemite
    version '1.5.2,10'
    sha256 'da575f4b3874e0042fddffb4462f4521019ceaa3f44942f64bce099b426cf2d1'
    url "https://static.roland.com/assets/media/tgz/quad_mx#{version.after_comma}d#{version.before_comma.no_dots}.tgz"
  elsif MacOS.version <= :sierra
    version '1.5.3,12'
    sha256 '712b27a25275d748e35c174b242f21a2967f5caca013f6cb09330b9232288770'
    url "https://static.roland.com/assets/media/tgz/quad_m#{version.after_comma}d#{version.before_comma.no_dots}.tgz"
  else
    version '1.5.4,13'
    sha256 'd3524d7844d24805c3a1c25c09dce62ab87d4c8dd6941a0b1d3653c696563117'
    url "https://static.roland.com/assets/media/tgz/quad_m#{version.after_comma}d#{version.before_comma.no_dots}.tgz"
  end

  name 'Roland Quad-Capture USB Driver'
  homepage 'https://www.roland.com/us/support/by_product/quad-capture/updates_drivers/'

  depends_on macos: '>= :yosemite'

  pkg "QuadCaptureUSBDriver/QuadCapture_USBDriver10#{version.after_comma}.pkg"

  uninstall pkgutil:   [
                         "jp.co.roland.QuadCapture.app.10#{version.after_colon}.pkg",
                         "jp.co.roland.QuadCapture.kext.10#{version.after_colon}.pkg",
                         "jp.co.roland.QuadCapture.midi.10#{version.after_colon}.pkg",
                         "jp.co.roland.QuadCapture.start.10#{version.after_colon}.pkg",
                       ],
            launchctl: [
                         'jp.co.roland.RDUSB012FSetupd',
                       ],
            quit:        'QUAD-CAPTURE Control Panel',
            kext:      [
                         'jp.co.roland.RDUSB012FDev',
                       ],
            script:    [
                         executable: "#{staged_path}/QuadCaptureUSBDriver/Uninstaller.app/Contents/MacOS/Uninstaller",
                         sudo:       true,
                       ],
            delete:    [
                        '/Applications/QUAD-CAPTURE Control Panel.app',
                        '/Applications/Roland/QUAD-CAPTURE Driver',
                       ]

  caveats do
    license 'https://www.roland.com/us/support/by_product/quad-capture/updates_drivers/53d8a307-a8ae-4f9b-9a59-a1adb8c67012/'
    reboot
  end
end
