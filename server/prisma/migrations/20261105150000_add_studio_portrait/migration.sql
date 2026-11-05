-- AlterTable
ALTER TABLE "studio_profile"
ADD COLUMN "portraitImageUrl" TEXT NOT NULL DEFAULT '/img/about/portrait.jpg',
ADD COLUMN "portraitImageAlt" TEXT NOT NULL DEFAULT 'Studio portrait — glasses and knit collar against a neutral studio wall';

-- Normalize older same-site image URLs so the database does not depend on a host name.
UPDATE "projects"
SET "coverImageUrl" = substring("coverImageUrl" FROM '^https?://[^/]+(/(img|uploads)/.*)$')
WHERE "coverImageUrl" ~* '^https?://[^/]+/(img|uploads)/';

UPDATE "project_images"
SET "url" = substring("url" FROM '^https?://[^/]+(/(img|uploads)/.*)$')
WHERE "url" ~* '^https?://[^/]+/(img|uploads)/';

UPDATE "services"
SET "imageUrl" = substring("imageUrl" FROM '^https?://[^/]+(/(img|uploads)/.*)$')
WHERE "imageUrl" ~* '^https?://[^/]+/(img|uploads)/';

UPDATE "team_members"
SET "imageUrl" = substring("imageUrl" FROM '^https?://[^/]+(/(img|uploads)/.*)$')
WHERE "imageUrl" ~* '^https?://[^/]+/(img|uploads)/';

UPDATE "studio_profile"
SET "heroImageUrl" = substring("heroImageUrl" FROM '^https?://[^/]+(/(img|uploads)/.*)$')
WHERE "heroImageUrl" ~* '^https?://[^/]+/(img|uploads)/';

UPDATE "studio_profile"
SET "portraitImageUrl" = substring("portraitImageUrl" FROM '^https?://[^/]+(/(img|uploads)/.*)$')
WHERE "portraitImageUrl" ~* '^https?://[^/]+/(img|uploads)/';

UPDATE "studio_profile"
SET "introImageUrl" = substring("introImageUrl" FROM '^https?://[^/]+(/(img|uploads)/.*)$')
WHERE "introImageUrl" ~* '^https?://[^/]+/(img|uploads)/';

UPDATE "studio_profile"
SET "philosophyImageUrl" = substring("philosophyImageUrl" FROM '^https?://[^/]+(/(img|uploads)/.*)$')
WHERE "philosophyImageUrl" ~* '^https?://[^/]+/(img|uploads)/';
