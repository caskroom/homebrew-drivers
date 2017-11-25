cask 'kensington-trackball-works' do
  version '1.3.0'
  sha256 '6c2271211f71fc80e237dad2a86f253b408e985d5aea58e574ac89f54e4ce1fc'

  # accoblobstorageus.blob.core.windows.net was verified as official when first introduced to the cask
  url 'https://accoblobstorageus.blob.core.windows.net/software/97966e13-53b1-41e9-9c23-12a2c15dec5a.dmg'
  name 'Kensington TrackballWorks'
  homepage 'https://www.kensington.com/'

  pkg 'Kensington TrackballWorks.pkg'

  uninstall pkgutil:   'com.kensington.trackballworks.driver.installer',
            kext:      'com.kensington.trackballworks.driver',
            launchctl: [
                         'com.kensington.slimblade.agent',
                         'com.kensington.slimblade.guiagent.plist',
                       ],
            quit:      'com.kensington.trackballworks.helper'
end
