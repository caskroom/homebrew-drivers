cask "safenet-authentication-client" do
  if MacOS.version <= :catalina
    version "10.2.109.0"
    sha256 "d0c316379c03e17a35a53e81df641b85b38b5cf7b7a8f6b5f11789a0819f943a"
    url "https://www.globalsign.com/en/safenet-drivers/USB/#{version.major_minor}/Safenet_#{version.major_minor}_Post_GA_R3.zip"
    container nested: "Safenet #{version.major_minor} Post GA R3/Safenet #{version.major_minor} Post GA R3/SafeNetAuthenticationClient.#{version}.dmg"
  else
    version "10.2.111.0"
    sha256 "af622151e7188d25f326420d3d210dc676002c765a670bd756fd40bd050fd0a5"
    url "https://www.globalsign.com/en/safenet-drivers/USB/#{version.major_minor}/Safenet_#{version.major_minor}_Post_GA_(R4).zip"
    container nested: "Safenet #{version.major_minor} Post GA (R4) 2/SafeNet Authentication Client #{version.major_minor}.pkg"
  end

  name "SafeNet Authentication Client"
  desc "Client for smart card readers and security tokens"
  homepage "https://support.globalsign.com/ssl/ssl-certificates-installation/safenet-drivers"

  livecheck do
    skip "No version information available"
  end

  depends_on macos: [
    :catalina,
    :big_sur,
  ]

  pkg "SafeNet Authentication Client #{version.major_minor}.pkg"

  uninstall	launchctl: [
    "com.SafeNet.SACMonitor",
    "com.SafeNet.SACSrv",
  ],
            signal:    ["QUIT", "com.SafeNet.SACMonitor"],
            quit:	     [
              "com.gemalto.Gemalto-Smart-Card-Token.PKCS11-Token",
            ],
            pkgutil:   [
              "com.safenet.safenetAuthenticationClient.eTokenConf.pkg",
              "com.safenet.safenetAuthenticationClient.eTokenFramework.pkg",
              "com.safenet.safenetAuthenticationClient.scripts.pkg",
            ],
            delete:	   "/Applications/SafeNet"

  zap trash: "~/Library/Application Scripts/com.gemalto.Gemalto-Smart-Card-Token.PKCS11-Token"
end
