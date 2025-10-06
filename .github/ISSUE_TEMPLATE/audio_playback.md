---
name: "Add audio playback for letters"
about: Implement real audio pronunciations for A–Z and a–z
labels: enhancement
---

### Summary
Implement real audio pronunciations for A–Z and a–z using `audioplayers`.

### Tasks
- Add audio files under `assets/audio/letters/` with clear naming (e.g., `A.mp3`, `a.mp3`).
- Wire tap on model letter to play corresponding audio.
- Update `pubspec.yaml` to include assets.
- Test on iOS, Android, and macOS.

### Acceptance Criteria
- Tapping the model letter plays the correct audio on all platforms.
- No runtime asset resolution errors.
