class StyleStats
  class Configuration
    def options
      @options ||= {
        stylesheets:                   true,
        size:                          true,
        dataUriSize:                   false,
        ratioOfDataUriSize:            false,
        gzippedSize:                   true,
        simplicity:                    false,
        rules:                         false,
        selectors:                     false,
        mostIdentifier:                false,
        mostIdentifierSelector:        false,
        lowestCohesion:                false,
        lowestCohesionSelector:        false,
        totalUniqueFontSizes:          false,
        uniqueFontSizes:               false,
        totalUniqueColors:             false,
        uniqueFontFamilies:            false,
        uniqueColors:                  false,
        idSelectors:                   false,
        universalSelectors:            false,
        unqualifiedAttributeSelectors: false,
        javascriptSpecificSelectors:   false,
        userSpecifiedSelectors:        '#foo',
        importantKeywords:             false,
        floatProperties:               false,
        mediaQueries:                  false,
        propertiesCount:               false
      }
    end
  end
end