# Optical correction fixture

- Product: Project management SaaS
- Component: Page header with icon + heading + action button
- Current implementation:
  - Icon (24x24px SVG) + H1 heading in a flex row, icon side padding: 16px left / 16px right
  - H1 font-size: 32px, letter-spacing: 0.04em (default browser tracking)
  - Icon aligned with align-items: center (geometric center of flex row)
  - Container padding-top: 24px, padding-bottom: 24px
  - Button "New Project" with equal 12px padding on all sides
- Context:
  - Design system base unit: 4px
  - Line-height for H1: 1.3 (so half-leading above = (1.3 - 1) x 32px / 2 = 4.8px)
  - Icon is geometric (circle-based SVG, optical center lower than geometric center)
