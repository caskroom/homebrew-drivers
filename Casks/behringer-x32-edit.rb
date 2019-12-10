cask 'behringer-x32-edit' do
  # note: "32" is not a version number, but an intrinsic part of the product name
  version '4.1'
  sha256 '439f1d3d789958f4e44b53116d247363adf56aa62941dfadc0b0a6b4e458203d'

  # downloads.musictribe.com was verified as official when first introduced to the cask
  url "https://downloads.musictribe.com/software/behringer/X32/X32-Edit_MAC_#{version.major_minor}.zip"
  appcast 'https://www.behringer.com/Categories/Behringer/Mixers/Digital/X32/p/P0ASF/Downloads',
          configuration: version.major_minor
  name 'Behringer X32-Edit'
  homepage 'https://www.behringer.com/Categories/Behringer/Mixers/Digital/X32/p/P0ASF/Downloads#googtrans(en|en)'

  app 'X32-Edit.app'

  uninstall quit:   'com.music-group.X32-Edit',
            delete: '/Library/Logs/DiagnosticReports/X32-Edit_*.wakeups_resource.diag'

  zap trash: [
               '~/Library/Application Support/CrashReporter/X32-Edit_*.plist',
               '~/Library/Saved Application State/com.music-group.X32-Edit.savedState',
             ]

  caveats do
    license 'https://www.behringer.com/Categories/Behringer/Mixers/Digital/X32/p/P0ASF/Downloads#googtrans(en|en)'
  end
end
