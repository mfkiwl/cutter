set(TS_FILES
    translations/ar/cutter_ar.ts
    translations/bn/cutter_bn.ts
    translations/ca/cutter_ca.ts
    translations/de/cutter_de.ts
    translations/es-ES/cutter_es.ts
    translations/fa/cutter_fa.ts
    translations/fi/cutter_fi.ts
    translations/fr/cutter_fr.ts
    translations/he/cutter_he.ts
    translations/hi/cutter_hi.ts
    translations/it/cutter_it.ts
    translations/ja/cutter_ja.ts
    translations/ko/cutter_ko.ts
    translations/nl/cutter_nl.ts
    translations/pl/cutter_pl.ts
    translations/pt-PT/cutter_pt.ts
    translations/ro/cutter_ro.ts
    translations/ru/cutter_ru.ts
    translations/tr/cutter_tr.ts
    translations/uk/cutter_uk.ts
    translations/ur-PK/cutter_ur.ts
    translations/vi/cutter_vi.ts
    translations/zh-CN/cutter_zh.ts
)
# translations/pt-BR/cutter_pt.ts #2321 handling multiple versions of a language

set_source_files_properties(${TS_FILES} PROPERTIES OUTPUT_LOCATION ${CMAKE_CURRENT_BINARY_DIR}/translations)
if (CUTTER_QT EQUAL 6)
    find_package(Qt6LinguistTools REQUIRED)
    qt6_add_translation(qmFiles ${TS_FILES})
elseif(CUTTER_QT EQUAL 5)
    find_package(Qt5LinguistTools REQUIRED)
    qt5_add_translation(qmFiles ${TS_FILES})
endif()
add_custom_target(translations ALL DEPENDS ${qmFiles} SOURCES ${TS_FILES})

install(FILES
    ${qmFiles}
    # For Linux it might be more correct to use ${MAKE_INSTALL_LOCALEDIR}, but that
    # uses share/locale_name/software_name layout instead of share/software_name/locale_files.
    DESTINATION ${CUTTER_INSTALL_DATADIR}/translations
)

