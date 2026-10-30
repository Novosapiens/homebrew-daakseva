cask "daakseva" do
  version "2.0.1"
  sha256 "d51a1ec6ece1d3d5666a7162851cbe257c96c4bfb4f9d207f694544c8a99c590"

  url "https://github.com/Novosapiens/daakseva-releases/releases/download/v#{version}/Daakseva-#{version}-arm64.dmg"
  name "Daakseva"
  desc "Menu bar email client built on Mailspring"
  homepage "https://github.com/Novosapiens/daakseva-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Daakseva.app"

  # Unregistered here, not in zap: zap runs after the app is gone, when lsregister -u does nothing.
  uninstall quit:   "com.novosapiens.daakseva",
            script: {
              executable: "/bin/sh",
              args:       ["-c", <<~SH],
                LS=/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support
                "$LS/lsregister" -u '/Applications/Daakseva.app' || true
              SH
              sudo:       false,
            }

  # The same as the in-app uninstall (uninstall-list.json), plus what it does with macOS's tools.
  zap login_item: "Daakseva",
      script:     {
        executable: "/bin/sh",
        args:       ["-c", <<~SH],
          exec > /dev/null 2>&1
          security delete-generic-password -s 'Daakseva Safe Storage'
          defaults delete 'com.novosapiens.daakseva'
          tccutil reset All 'com.novosapiens.daakseva'
          true
        SH
        sudo:       false,
      },
      trash:      [
        "~/Library/Application Support/CrashReporter/Daakseva_*.plist",
        "~/Library/Application Support/Daakseva",
        "~/Library/Caches/com.novosapiens.daakseva",
        "~/Library/Caches/com.novosapiens.daakseva.ShipIt",
        "~/Library/HTTPStorages/com.novosapiens.daakseva",
        "~/Library/HTTPStorages/com.novosapiens.daakseva.binarycookies",
        "~/Library/Logs/Daakseva",
        "~/Library/Logs/DiagnosticReports/Daakseva-*.ips",
        "~/Library/Preferences/com.novosapiens.daakseva.plist",
        "~/Library/Saved Application State/com.novosapiens.daakseva.savedState",
      ]
end
