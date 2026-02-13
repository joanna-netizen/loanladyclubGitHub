# The Loan Lady Club – Joanna Perry Website

Astro + Tailwind CSS site for **The Loan Lady Club** (Joanna Perry, mortgage broker). Built for static deployment (e.g. Netlify).

## Tech stack

- **Astro** (static site)
- **Tailwind CSS** (v4)
- **Fonts:** Outfit, Inter, Caveat (Google Fonts)

## Commands

| Command        | Action           |
|----------------|------------------|
| `npm run dev`  | Start dev server |
| `npm run build`| Production build |
| `npm run preview` | Preview production build |

## Project location

The project was created as **whole-wasp** (because the folder `joanna-perry-website` was not empty). You can rename `whole-wasp` to `joanna-perry-website` if you like. The app name in `package.json` is still `whole-wasp`; you can change it to `joanna-perry-website`.

## Git configuration (if you use Git)

If Git is installed and you want to set your identity for this repo:

```bash
git config user.name "joanna-netizen"
git config user.email "joanna@loanladyclub.com"
```

## Before launch – replace placeholders

- **Phone:** Replace `(XXX) XXX-XXXX` in `Footer.astro` and `contact.astro` with your real number.
- **NMLS#:** Replace `XXXXXXX` in `Footer.astro` with your NMLS number.
- **Formspree:** In `ContactForm.astro`, set the `formId` prop to your Formspree form ID (or pass it from the page). Replace `YOUR_FORM_ID` in the form action if you use the default.
- **Calendly:** On the contact page, replace the placeholder with your Calendly embed (e.g. inline widget with your Calendly URL).
- **Images:** Add real assets under `public/images/`:
  - `joanna-headshot.jpg` – replace the placeholder (Hero currently uses `placeholder-avatar.svg`; point it to your headshot when ready).
  - `logo.svg` / `logo-white.svg` – replace with your real logos.
  - `video-thumb-1.jpg`, `video-thumb-2.jpg`, `video-thumb-3.jpg` – use real video thumbnails or keep the shared `video-thumb.svg` placeholder.
  - `og-default.jpg`, `og-homepage.jpg` – add real OG images for sharing.
- **Privacy & Terms:** Replace placeholder content in `src/pages/privacy.astro` and `src/pages/terms.astro` with your full policies.
- **Social links:** In `Footer.astro`, set real URLs for Facebook, LinkedIn, Instagram or remove the icons.

## Deploy (e.g. Netlify)

1. Connect the repo to Netlify.
2. Build command: `npm run build`
3. Publish directory: `dist`
4. Optional env vars: `FORMSPREE_FORM_ID`, `CALENDLY_URL`, `PUBLIC_GA_ID` (if you add analytics).

## Structure

- `src/components/layout/` – Header, Footer, Layout
- `src/components/home/` – Homepage sections (Hero, ProblemSolution, Benefits, Testimonials, Services, TwoFutures, FAQ)
- `src/components/shared/` – SectionHeader, Button, ContactForm, ProgressTracker
- `src/components/interactive/` – MortgageCalculator, ReadinessQuiz, FAQAccordion
- `src/pages/` – All routes (index, about, buyers-edge, services/*, how-it-works, resources, testimonials, contact, privacy, terms)
