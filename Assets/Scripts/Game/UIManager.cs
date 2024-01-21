using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance;

    void Start()
    {
        Instance = this;
    }

    [SerializeField]
    Text LevelText;
    [SerializeField]
    Text InventoryText;

    public void SetLevel(int level)
    {
        if (!LevelText)
            return;
        LevelText.text = "Current Level: " + level;
    }

    public void SetInventory(string[] items)
    {
        if (!InventoryText)
            return;

        InventoryText.text = "-- Held Items --\n";

        if(items.Length == 0)
        {
            InventoryText.text += "--";
            return;
        }
        else
        {
            for(int i = 0; i < items.Length; i++)
            {
                InventoryText.text += items[i];
            }
        }
    }
}
