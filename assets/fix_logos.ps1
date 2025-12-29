# Fix all logos to have the same India flag badge

# Horizontal logo - at position (510, 125)
$horizontal = Get-Content "C:\Users\User\src\assets\EstatelyticAI_Logo_Horizontal_v2.svg" -Raw
$horizontalBadge = @'
  <g transform="translate(510, 125)">
    <rect x="0" y="0" width="170" height="32" rx="16" fill="#f8fafc" stroke="#e2e8f0" stroke-width="1.5"/>
    <g transform="translate(10, 6)">
      <rect x="0" y="0" width="28" height="6" fill="#FF9933"/>
      <rect x="0" y="6" width="28" height="6" fill="#ffffff" stroke="#d1d5db" stroke-width="0.3"/>
      <rect x="0" y="12" width="28" height="6" fill="#138808"/>
      <circle cx="14" cy="9" r="2.5" fill="none" stroke="#000080" stroke-width="0.3"/>
      <circle cx="14" cy="9" r="0.4" fill="#000080"/>
      <line x1="14" y1="6.5" x2="14" y2="11.5" stroke="#000080" stroke-width="0.2"/>
      <line x1="16.5" y1="9" x2="11.5" y2="9" stroke="#000080" stroke-width="0.2"/>
      <line x1="15.8" y1="7.2" x2="12.2" y2="10.8" stroke="#000080" stroke-width="0.2"/>
      <line x1="15.8" y1="10.8" x2="12.2" y2="7.2" stroke="#000080" stroke-width="0.2"/>
    </g>
    <text x="50" y="19" font-family="Arial, Helvetica, sans-serif" font-size="14" font-weight="700" fill="#1e293b">
      Made in <tspan fill="#FF9933">I</tspan><tspan fill="#000080">N</tspan><tspan fill="#138808">D</tspan><tspan fill="#FF9933">I</tspan><tspan fill="#000080">A</tspan>
    </text>
  </g>
'@
$horizontal = $horizontal -replace '(?s)  <g transform="translate\(510, 125\)">.*?</svg>', ($horizontalBadge + "`r`n</svg>")
$horizontal | Set-Content "C:\Users\User\src\assets\EstatelyticAI_Logo_Horizontal_v2.svg" -NoNewline

# Icon Only logo - at position (30, 175)
$icon = Get-Content "C:\Users\User\src\assets\EstatelyticAI_Logo_Icon_Only_v2.svg" -Raw
$iconBadge = @'
  <g transform="translate(30, 175)">
    <rect x="0" y="0" width="170" height="32" rx="16" fill="#f8fafc" stroke="#e2e8f0" stroke-width="1.5"/>
    <g transform="translate(10, 6)">
      <rect x="0" y="0" width="28" height="6" fill="#FF9933"/>
      <rect x="0" y="6" width="28" height="6" fill="#ffffff" stroke="#d1d5db" stroke-width="0.3"/>
      <rect x="0" y="12" width="28" height="6" fill="#138808"/>
      <circle cx="14" cy="9" r="2.5" fill="none" stroke="#000080" stroke-width="0.3"/>
      <circle cx="14" cy="9" r="0.4" fill="#000080"/>
      <line x1="14" y1="6.5" x2="14" y2="11.5" stroke="#000080" stroke-width="0.2"/>
      <line x1="16.5" y1="9" x2="11.5" y2="9" stroke="#000080" stroke-width="0.2"/>
      <line x1="15.8" y1="7.2" x2="12.2" y2="10.8" stroke="#000080" stroke-width="0.2"/>
      <line x1="15.8" y1="10.8" x2="12.2" y2="7.2" stroke="#000080" stroke-width="0.2"/>
    </g>
    <text x="50" y="19" font-family="Arial, Helvetica, sans-serif" font-size="14" font-weight="700" fill="#1e293b">
      Made in <tspan fill="#FF9933">I</tspan><tspan fill="#000080">N</tspan><tspan fill="#138808">D</tspan><tspan fill="#FF9933">I</tspan><tspan fill="#000080">A</tspan>
    </text>
  </g>
'@
$icon = $icon -replace '(?s)  <g transform="translate\(30, 175\)">.*?</svg>', ($iconBadge + "`r`n</svg>")
$icon | Set-Content "C:\Users\User\src\assets\EstatelyticAI_Logo_Icon_Only_v2.svg" -NoNewline

# Dark BG logo - at position (140, 210), brighter colors
$dark = Get-Content "C:\Users\User\src\assets\EstatelyticAI_Logo_Dark_BG_v2.svg" -Raw
$darkBadge = @'
  <g transform="translate(140, 210)">
    <rect x="0" y="0" width="170" height="35" rx="17" fill="#1e293b" stroke="#334155" stroke-width="1.5"/>
    <g transform="translate(10, 8)">
      <rect x="0" y="0" width="28" height="6" fill="#FF9933"/>
      <rect x="0" y="6" width="28" height="6" fill="#ffffff"/>
      <rect x="0" y="12" width="28" height="6" fill="#138808"/>
      <circle cx="14" cy="9" r="2.5" fill="none" stroke="#60a5fa" stroke-width="0.3"/>
      <circle cx="14" cy="9" r="0.4" fill="#60a5fa"/>
      <line x1="14" y1="6.5" x2="14" y2="11.5" stroke="#60a5fa" stroke-width="0.2"/>
      <line x1="16.5" y1="9" x2="11.5" y2="9" stroke="#60a5fa" stroke-width="0.2"/>
      <line x1="15.8" y1="7.2" x2="12.2" y2="10.8" stroke="#60a5fa" stroke-width="0.2"/>
      <line x1="15.8" y1="10.8" x2="12.2" y2="7.2" stroke="#60a5fa" stroke-width="0.2"/>
    </g>
    <text x="50" y="21" font-family="Arial, Helvetica, sans-serif" font-size="14" font-weight="700" fill="#f1f5f9">
      Made in <tspan fill="#FF9933">I</tspan><tspan fill="#60a5fa">N</tspan><tspan fill="#138808">D</tspan><tspan fill="#FF9933">I</tspan><tspan fill="#60a5fa">A</tspan>
    </text>
  </g>
'@
$dark = $dark -replace '(?s)  <g transform="translate\(140, 210\)">.*?</svg>', ($darkBadge + "`r`n</svg>")
$dark | Set-Content "C:\Users\User\src\assets\EstatelyticAI_Logo_Dark_BG_v2.svg" -NoNewline

Write-Output "`n✅ Fixed all 3 logos to match the clean India flag design!"
