#!/usr/bin/env ruby

class Chromium < Formula
  desc "Open-source web browser"
  homepage "https://www.chromium.org/getting-involved/download-chromium"

  if Hardware::CPU.arm?
    url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac_Arm%2F1087222%2Fchrome-mac.zip?generation=1672188928924301&alt=media",
        using: :nounzip
  # not the actual checksum
  # sha256 "a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6"
  else
    url "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2F1087188%2Fchrome-mac.zip?generation=1672180668005623&alt=media",
        using: :nounzip
    # not the actual checksum
    # sha256 "f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1"
  end

  def install
    # Extract the zip file
    system "unzip", "chrome-mac.zip"
    # Move the app to the prefix
    system "mv", "chrome-mac/Chromium.app", "#{prefix}"
    # Remove quarantine attribute
    system "xattr", "-d", "com.apple.quarantine", "#{prefix}/Chromium.app"
  end
end
