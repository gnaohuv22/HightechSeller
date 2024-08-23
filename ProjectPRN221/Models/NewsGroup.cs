﻿using System;
using System.Collections.Generic;

namespace ProjectPRN221.Models;

public partial class NewsGroup
{
    public int NewsgroupId { get; set; }

    public string? NewsgroupName { get; set; }

    public virtual ICollection<News> News { get; } = new List<News>();
}
