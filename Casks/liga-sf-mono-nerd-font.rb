# typed: false
# frozen_string_literal: true

cask "liga-sf-mono-nerd-font" do
  version "3.4.0"
  sha256 "ec8d60882e460cf6d07b071cbce3d45594f2b7e92835ad43aeb34668784163c2"

  url "https://github.com/jacobcxdev/LigaSFMonoNerdFont/releases/download/v3.4.0/LigaSFMonoNerdFont.zip"
  name "Liga SF Mono Nerd Font"
  desc "SFMono patched with ligatures and Nerd Fonts glyphs"
  homepage "https://github.com/jacobcxdev/LigaSFMonoNerdFont"

    font "LigaSFMonoNerdFont-Bold.otf"
    font "LigaSFMonoNerdFont-BoldItalic.otf"
    font "LigaSFMonoNerdFont-Medium.otf"
    font "LigaSFMonoNerdFont-SemiBold.otf"
    font "LigaSFMonoNerdFont-Light.otf"
    font "LigaSFMonoNerdFont-Heavy.otf"
    font "LigaSFMonoNerdFont-HeavyItalic.otf"
    font "LigaSFMonoNerdFont-LightItalic.otf"
    font "LigaSFMonoNerdFont-MediumItalic.otf"
    font "LigaSFMonoNerdFont-SemiBoldItalic.otf"
    font "LigaSFMonoNerdFont-Italic.otf"
    font "LigaSFMonoNerdFont-Regular.otf"
end
