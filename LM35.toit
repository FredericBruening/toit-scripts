class LM35:
    temperature /string := ""
    mV /float := 0.0

    update new_mV /float:
        mV = new_mV
        temperature = (mV * 100).stringify 2
