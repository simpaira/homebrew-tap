cask "itsmypa" do
  version "0.1.1"
  sha256 "8ce6ed987e412269d2196b4a83d2e5d67554df625014b32d294430e6f54be58d"

  url "https://github.com/simpaira/itsmypa/releases/download/v#{version}/ItsMyPA.dmg"
  name "ItsMyPA"
  desc "Private AI meeting notes — transcription, speaker separation and structured notes, 100% on-device"
  homepage "https://github.com/simpaira/itsmypa"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "ItsMyPA.app"

  zap trash: [
    "~/Library/Application Support/ItsMyPA",
  ]

  caveats <<~EOS
    ItsMyPA is not signed with an Apple Developer ID (the source is public
    instead: https://github.com/simpaira/itsmypa). If macOS blocks the first
    launch, either reinstall with:
      brew reinstall --cask --no-quarantine itsmypa
    or approve it under System Settings → Privacy & Security → "Open Anyway".

    First launch downloads the AI models (~5 GB, one time). After that,
    ItsMyPA works fully offline.
  EOS
end
