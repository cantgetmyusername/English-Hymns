%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Tis Good, Lord, To Be Here"  }
  meter = \markup { \small { Music: SWABIA, S.M.;  J.M. Spiess, 1745; arr. W.H. Havergal, 1847} }
  piece = \markup { \small {Text: J.A. Robinson, 1888}}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  a4 |
  fs g e e |
  d2. e4 |
  fs8[ gs] a4 a gs |
  a2. \bar "||" \break

  a4 |
  b a b cs |
  d d d \breathe a4 |
  g fs e e |
  d2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  fs4 |
  d d d cs |
  d2. cs4 |
  d e8[ fs] e4 e |
  e2.

  fs4 |
  g fs g g |
  fs g fs fs |
  e d d cs |
  d2.
}

tenor = \relative c' {
  \global
  \partial 4
  d4 |
  a b a a |
  fs2. a4 |
  a cs b b |
  cs2.

  d4 |
  d4 d d e |
  d b a d |
  b8[ cs] d4 a a |
  fs2.
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d g, a a |
  b2. a4 |
  d cs8[ d] e4 e |
  a,2.

  d4 |
  g4 d g e |
  b' g d d |
  e fs8[ g] a4 a, |
  d2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  'Tis good, Lord, to be here!
  Thy glo -- ry fills the night;
  Thy face and gar -- ments, like the sun,
  Shine with un -- bor -- rowed light.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  'Tis good, Lord, to be here,
  Thy beau -- ty to be -- hold,
  Where Mo -- ses and E -- li -- jah stand,
  Thy mes -- sen -- gers of old.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Ful -- fil -- ler of the past!
  Pro -- mise of things to be!
  We hail Thy Bo -- dy glo -- ri -- fied,
  And our re -- demp -- tion see.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Be -- fore we taste of death,
  We see Thy king -- dom come;
  We fain would hold the vi -- sion bright,
  And make this hill our home.
}

verseFive = \lyricmode {
  \set stanza = "5."
  'Tis good, Lord, to be here!
  Yet we may not re -- main;
  But since Thou bidst us leave the mount
  Come with us to the plain.
}



\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour
      \context Lyrics = five \lyricsto sopranos \verseFive

    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {}
}
