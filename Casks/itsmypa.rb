cask "itsmypa" do
  version "0.2.0"
  sha256 "0e99c208b3e2be00618d252f208e44663d6e171800029cc56facee7e6e46cf6c"

  url "https://github.com/simpaira/itsmypa/releases/download/v#{version}/ItsMyPA.dmg"
  name "ItsMyPA"
  desc "Private AI meeting notes with transcription and speaker labels, on-device"
  homepage "https://github.com/simpaira/itsmypa"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ItsMyPA.app"

  zap trash: "~/Library/Application Support/ItsMyPA"

  caveats <<~EOS
    ItsMyPA is not signed with an Apple Developer ID (the source is public
    instead: https://github.com/simpaira/itsmypa). If macOS blocks the first
    launch, either reinstall with:
      brew reinstall --cask --no-quarantine itsmypa
    or approve it under System Settings → Privacy & Security → "Open Anyway".

    First launch downloads the AI models (~2.6 GB, one time). After that,
    ItsMyPA works fully offline. Requires macOS 14.6 or newer.
  EOS
end
