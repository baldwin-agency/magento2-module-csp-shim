<?php

declare(strict_types=1);

namespace Magento\Csp\Model\Policy;

class FetchPolicy
{
    public function __construct(
        string $id,
        bool $noneAllowed = true,
        array $hostSources = [],
        array $schemeSources = [],
        bool $selfAllowed = false,
        bool $inlineAllowed = false,
        bool $evalAllowed = false,
        array $nonceValues = [],
        array $hashValues = [],
        bool $dynamicAllowed = false,
        bool $eventHandlersAllowed = false
    ) {
        // do nothing
    }
}
