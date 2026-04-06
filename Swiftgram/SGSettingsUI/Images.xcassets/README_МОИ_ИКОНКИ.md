# Куда класть свои иконки (GLEGram)

Замените файлы в этих папках своими картинками — приложение подхватит их автоматически.

## Шапка экрана GLEGram

| Папка | Файл | Назначение |
|-------|------|------------|
| `GLEGramSettings.imageset/` | **GLEGramSettings.png** | Большая иконка в шапке экрана GLEGram |

Рекомендуемый размер: около 80×80 pt (или 240×240 px для @3x).

---

## Вкладки раздела «Функции»

| Папка | Файл | Назначение |
|-------|------|------------|
| `GLEGramTabAppearance.imageset/` | **GLEGramTabAppearance.png** | Иконка «Оформление» |
| `GLEGramTabSecurity.imageset/` | **GLEGramTabSecurity.png** | Иконка «Приватность» |
| `GLEGramTabPlugins.imageset/` | **GLEGramTabPlugins.png** | Иконка «Твики» |
| `GLEGramTabOther.imageset/` | **GLEGramTabOther.png** | Иконка «Другие функции» |

Рекомендуемый размер для иконок в списке: 24×24 pt (72×72 px для @3x). Формат: PNG (можно и PDF в одной шкале).

---

## Другие ресурсы

- `GLEGramVerifiedBadge.imageset/` — значок верификации (Galochka.png).
- `glePlugins/1.imageset/` — иконка по умолчанию для плагинов без своей иконки.
- `SwiftgramSettings.imageset/`, `SwiftgramPro.imageset/` — иконки пунктов меню настроек.

После замены файлов пересоберите приложение (Bazel).
