cask "launchpadder" do
  version "1.4"
  sha256 "e6f22aec28546b3ab418cb06c9a26c696126c4ec4daeeaebd1a427a8c8b86390"

  url "https://github.com/Molay/LaunchPadder/releases/download/v#{version}/LaunchPadder-v#{version}.zip"
  name "LaunchPadder"
  desc "Organize and sort apps and folders on LaunchPad following specific rules"
  homepage "https://github.com/Molay/LaunchPadder"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "LaunchPadder.app"

  zap trash: [
    "~/Library/Preferences/com.molayc.LaunchPadder.plist",
    "~/Library/Saved Application State/com.molayc.LaunchPadder.savedState",
  ]
end
